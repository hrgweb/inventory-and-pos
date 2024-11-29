import { crudHandler } from '~/server/utils/crud.handler'
import type { ISetting } from '~/types'

export default defineEventHandler(async (event) => {
  const { create } = await crudHandler(event)
  return await create<ISetting>('settings')
})
