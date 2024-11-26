import { serverSupabaseClient } from '#supabase/server'
import type { IOrderResponse } from '~/types'

export default defineEventHandler(async (event) => {
  const client = await serverSupabaseClient(event)

  const { transaction_no } = getQuery(event)

  if (!transaction_no) {
    throw createError({
      statusCode: 500,
      statusMessage: 'Transaction number not found'
    })
  }

  const { data, error } = await client
    .from('orders')
    .select(
      `
      id,
      transaction_no,
      products (
        id,
        name,
        price,
        barcode
      ),
      price,
      qty,
      subtotal
    `
    )
    .eq('transaction_no', transaction_no)

  if (error) throw error

  const formmattedData = data.map((item) => {
    return {
      ...item,
      product: item.products,
      products: undefined
    }
  }) as IOrderResponse[]

  return formmattedData
})
