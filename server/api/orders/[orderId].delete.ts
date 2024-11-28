import { crudHandler } from '~/server/utils/crud.handler'

export default defineEventHandler(async (event) => {
  const { remove } = await crudHandler(event)
  return await remove<any>('orders', 'orderId')
})
