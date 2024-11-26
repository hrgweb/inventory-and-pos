import { serverSupabaseClient } from '#supabase/server'
import { IProduct } from '~/types'
import { crudHandler } from '~/server/utils/crud.handler'

export default defineEventHandler(async (event) => {
  const client = await serverSupabaseClient(event)

  const { barcode } = await readBody(event)

  try {
    const product = await findProduct(barcode)
    const orderItem = await createOrderItems(product as never)
    // await createOrder()

    console.log(orderItem)
  } catch (error) {
    throw error
  }
  async function findProduct(barcode: string): Promise<IProduct | null> {
    const { data, error } = await client
      .from('products')
      .select('*')
      .like('barcode', barcode)

    if (error) throw error

    return data[0] as IProduct
  }
  async function createOrderItems(orderItem: IProduct): Promise<never | null> {
    const qty = 1 // default
    const payload = {
      order_id: 1,
      product_id: orderItem.id,
      price: orderItem.price,
      qty,
      subtotal: orderItem.price * qty
    } as never

    console.log(payload)

    const { data, error } = await client
      .from('order_items')
      .insert(payload)
      .select()

    if (error) throw error

    return data as never
  }
  // async function createOrder() {
  //   const { data } = await client.from('order-items').insert(orderItem).select()
  //   return data
  // }

  return {}
})
