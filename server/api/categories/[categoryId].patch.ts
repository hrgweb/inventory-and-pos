import { crudHandler } from '~/server/utils/crud.handler'
import { ICategory } from '~/types'

export default defineEventHandler(async (event) => {
  const { update } = await crudHandler(event)
  const data = await update<ICategory>('categories', 'categoryId')
  return data
})
