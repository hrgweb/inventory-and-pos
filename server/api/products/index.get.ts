import { crudHandler } from '~/server/utils/crud.handler'
import { IProduct } from '~/types'

export default defineEventHandler(async (event) => {
  const { findAll } = await crudHandler(event)
  return await findAll<IProduct>('products', '*', { columnToFilter: 'name' })
})
