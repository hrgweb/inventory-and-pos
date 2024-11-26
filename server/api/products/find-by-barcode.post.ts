import { serverSupabaseClient } from '#supabase/server'
import type { IOrder, IOrderResponse, IProduct } from '~/types'

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
  ): Promise<IOrderResponse[]> {
    // No product
    if (!product) {
      throw createError({
        statusCode: 500,
        statusMessage: 'Product not found'
      })
    }

    // No transaction
    if (!transaction_no) {
      throw createError({
        statusCode: 500,
        statusMessage: 'Transaction number not found'
      })
    }

    const qty = 1 // default
    const payload = {
      transaction_no,
      product_id: product.id,
      price: product.price,
      qty,
      subtotal: product.price * qty
    } as never

    const { data, error } = await client
      .from('orders')
      .insert(payload)
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

    if (error) throw error

    const formmattedData = data.map((item) => {
      return {
        ...item,
        product: item.products,
        products: undefined
      }
    }) as IOrderResponse[]

    return formmattedData
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
      return order[0] as IOrderResponse
    }
  } catch (error) {
    throw error
  }
  return null
})
