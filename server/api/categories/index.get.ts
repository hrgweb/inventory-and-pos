import { crudHandler } from '~/server/utils/crud.handler'
import type { ICategory } from '~/types'

export default defineEventHandler(async (event) => {
  const { findAll } = await crudHandler(event)
  return await findAll<ICategory>('categories', 'id, name')
})
