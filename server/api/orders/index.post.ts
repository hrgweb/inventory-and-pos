import { helperHandler } from '~/server/utils/helper.handler'
import { IOrderResponse } from '~/types'

export default defineEventHandler(async (event) => {
  const { user_id, transaction_no, product } = await readBody(event)
  const { createOrder } = await helperHandler(event)

  try {
    const order = await createOrder(product, {
      user_id,
      transaction_no
    })
    if (order && order.length) {
      return order[0] as IOrderResponse
    }
    return order
  } catch (error) {
    throw error
  }
})
