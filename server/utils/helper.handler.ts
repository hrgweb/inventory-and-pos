import { IOrderResponse, IProduct } from '~/types'
import { serverSupabaseClient } from '#supabase/server'
import { H3Event, EventHandlerRequest } from 'h3'

export async function helperHandler(event: H3Event<EventHandlerRequest>) {
  const supabase = await serverSupabaseClient(event)

  async function createOrder(
    product: IProduct,
    { user_id, transaction_no }: { user_id: string; transaction_no: string }
  ) {
    // No product
    if (!product) {
      throw createError({
        statusCode: 404,
        statusMessage: 'Product not found'
      })
    }

    // No transaction
    if (!transaction_no) {
      throw createError({
        statusCode: 404,
        statusMessage: 'Transaction number not found'
      })
    }

    const qty = 1 // default
    const sellingPrice = product.selling_price!
    const payload = {
      user_id,
      transaction_no,
      product_id: product.id,
      qty,
      subtotal: sellingPrice! * qty
    } as never

    const { data, error } = await supabase.from('orders').insert(payload)
      .select(`
    id,
    transaction_no,
    products (
      id,
      name,
      selling_price,
      barcode
    ),
    qty,
    subtotal
        `)

    if (error) throw createError(error)

    const formmattedData = data.map((item) => {
      return {
        ...item,
        product: item.products,
        products: undefined
      }
    }) as IOrderResponse[]

    return formmattedData
  }

  return { createOrder }
}
