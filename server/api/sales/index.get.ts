import { serverSupabaseClient } from '#supabase/server'
import { IOrderResponse, ISales, ITransaction } from '~/types'
import { mapItem } from '~/utils'

export default defineEventHandler(async (event) => {
  const supabase = await serverSupabaseClient(event)
  const query = getQuery(event)

  let page = (query?.page as number) || 1
  let itemsPerPage = 15
  let totalCount = 0
  //   const search = query?.search || ''

  async function fetchOrders({ transaction_no }: { transaction_no: string }) {
    const { data, error } = await supabase
      .from('orders')
      .select(
        `
products(
  id,
  name,
  selling_price,
  barcode
),
qty,
subtotal
    `
      )
      .eq('transaction_no', transaction_no)

    if (error) throw error

    return data
  }

  // First, get total count for pagination
  const { count } = await supabase
    .from('sales')
    .select('*', { count: 'exact', head: true })
  // .ilike('name', `${search}%`)

  const { data, error } = await supabase
    .from('sales')
    .select(
      `
transactions(
  id,
  transaction_no,
  status,
  created_at
),
amount,
total,
change
    `
    )
    // .ilike('name', `${search}%`)
    .order('id', { ascending: false })
    .range((page - 1) * itemsPerPage, page * itemsPerPage - 1)

  if (error) throw error

  const result = (await Promise.all(
    data.map(async (item) => {
      const _transaction_no = (item.transactions as ITransaction).transaction_no
      const newObj = mapItem(item) as any
      newObj['orders'] = await fetchOrders({
        transaction_no: _transaction_no
      })
      return newObj
    })
  )) as ISales[]

  totalCount = count || 0

  return {
    items: result,
    total: totalCount
  }
})
