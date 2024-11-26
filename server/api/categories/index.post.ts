import { crudHandler } from '~/server/utils/crud.handler'

export default defineEventHandler(async (event) => {
  const { create } = await crudHandler(event)
  return await create<any>('categories')
})
