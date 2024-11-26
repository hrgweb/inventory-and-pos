import { crudHandler } from '~/server/utils/crud.handler'
import { IProduct } from '~/types'

export default defineEventHandler(async (event) => {
  const { update } = await crudHandler(event)
  const data = await update<IProduct>('products', 'productId')
  return data
})
