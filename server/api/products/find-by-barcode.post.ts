import { serverSupabaseClient } from '#supabase/server'
import type { IOrderResponse, IProduct } from '~/types'

export default defineEventHandler(async (event) => {
  const supabase = await serverSupabaseClient(event)
  const body = await readBody(event)

  async function findProduct(barcode: string) {
    const { data, error } = await supabase
      .from('products')
      .select('id, name, selling_price, barcode')
      .like('barcode', barcode)

    if (error) throw createError(error)

    // No product found by barcode
    if (!data || data.length === 0) {
      throw createError({
        statusCode: 404,
        statusMessage: 'Product not found'
      })
    }

    // Check if data is an array
    if (Array.isArray(data)) {
      return data[0]
    }

    // Else object
    return data
  }

  async function createOrder(
    product: Pick<IProduct, 'id' | 'selling_price'>,
    transaction_no?: string
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
      user_id: body.user_id,
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

    return order
  } catch (error) {
    throw error
  }
})
