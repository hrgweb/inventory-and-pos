import { serverSupabaseClient } from '#supabase/server'
import { ISales, ITransaction } from '~/types'
import { mapItem, getCurrentDateRange } from '~/utils'

export default defineEventHandler(async (event) => {
  const supabase = await serverSupabaseClient(event)
  const query = getQuery(event)

  let page = (query?.page as number) || 1
  let itemsPerPage = 15
  let totalCount = 0
  const userId = query?.user_id as string
  const day = query?.day as Date
  const range = query?.range
    ? (JSON.parse(query.range as string) as { start: Date; end: Date })
    : undefined

  // Sql query to get total count.
  let sqlGetCount = supabase
    .from('sales')
    .select('*', { count: 'exact', head: true })
    .eq('user_id', userId)

  // Filter a day
  if (day) {
    sqlGetCount = sqlGetCount
      .gte('created_at', getCurrentDateRange(day).startOfDay.toISOString())
      .lte('created_at', getCurrentDateRange(day).endOfDay.toISOString())
  }

  // Filer a week or month or yearly
  if (range) {
    const { start, end } = range
    sqlGetCount = sqlGetCount.gte('created_at', start).lte('created_at', end)
  }

  const { data: _sqlGetCount, count } = await sqlGetCount

  // Sql query to filter sales
  const sqlGetSales = supabase
    .from('sales')
    .select(
      `
transactions(
  id,
  transaction_no,
  user_id,
  status,
  created_at
),
amount,
total,
change,
created_at
    `
    )
    .eq('user_id', userId)
    .order('created_at', { ascending: true })
    .range((page - 1) * itemsPerPage, page * itemsPerPage - 1)

  // Filter a day
  if (day) {
    sqlGetSales
      .gte('created_at', getCurrentDateRange(day).startOfDay.toISOString())
      .lte('created_at', getCurrentDateRange(day).endOfDay.toISOString())
  }

  // Filer a week or month or yearly
  if (range) {
    const { start, end } = range // JSON.parse(range) as { start: Date; end: Date }
    sqlGetSales.gte('created_at', start).lte('created_at', end)
  }

  const { data, error } = await sqlGetSales

  if (error) throw createError(error)

  const result = (await Promise.all(
    data.map(async (item) => {
      const _transaction_no = (item.transactions as ITransaction)
        .transaction_no as string
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

    if (error) throw createError(error)

    return data
  }

  return {
    items: result,
    total: totalCount
  }
})
