import { crudHandler } from '~/server/utils/crud.handler'

export default defineEventHandler(async (event) => {
  return await crudHandler(event)
})
