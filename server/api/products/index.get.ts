import { crudHandler } from '~/server/utils/crud.handler'
import { IProduct } from '~/types'

export default defineEventHandler(async (event) => {
  const { findAll } = await crudHandler(event)
  const data = await findAll<IProduct>('products', '*')
  return data
})
