import { serverSupabaseClient } from '#supabase/server'
import { IOrderResponse, ISales, ITransaction } from '~/types'
import { mapItem } from '~/utils'

export default defineEventHandler(async (event) => {
  const supabase = await serverSupabaseClient(event)
  const query = getQuery(event)

  let page = (query?.page as number) || 1
  let itemsPerPage = 15
  let totalCount = 0
  const userId = query?.user_id as string

  console.log('user: ', userId)

  // First, get total count for pagination
  const { count } = await supabase
    .from('sales')
    .select('*', { count: 'exact', head: true })
    .eq('user_id', userId)

  console.log('count: ', count)

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
    .eq('user_id', userId)
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

  return {
    items: result,
    total: totalCount
  }
})
