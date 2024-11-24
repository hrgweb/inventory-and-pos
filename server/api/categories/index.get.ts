import { crudHandler } from '~/server/utils/crud.handler'
import type { ICategory } from '~/types'

export default defineEventHandler(async (event) => {
  const { findMany } = await crudHandler(event)
  return await findMany<ICategory>('categories', 'id, name', {
    column: 'name',
    order: 'asc'
  })
})
