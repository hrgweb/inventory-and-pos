import { serverSupabaseClient } from '#supabase/server'
import { IOrder, IProduct } from '~/types'
import { crudHandler } from '~/server/utils/crud.handler'

export default defineEventHandler(async (event) => {
  const client = await serverSupabaseClient(event)

  async function findProduct(barcode: string): Promise<IProduct | null> {
    const { data, error } = await client
      .from('products')
      .select('*')
      .like('barcode', barcode)

    if (error) throw error

    return data[0] as IProduct
  }

  async function createOrder(
    product: IProduct,
    transaction_no?: string
  ): Promise<IOrder[]> {
    const qty = 1 // default
    const payload = {
      transaction_no,
      product_id: product.id,
      price: product.price,
      qty,
      subtotal: product.price * qty
    } as never

    const { data, error } = await client.from('orders').insert(payload).select()
    if (error) throw error
    return data as IOrder[]
  }

  const { barcode, transaction_no } = await readBody(event)

  try {
    // Find the product by barcode
    const product = await findProduct(barcode)

    // No product found return null
    if (!product) return null

    // Create an order
    const order = await createOrder(product, transaction_no)
    if (order && order.length) {
      return order[0] as IOrder
    }
  } catch (error) {
    throw error
  }
  return null
})
