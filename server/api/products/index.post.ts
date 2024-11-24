import { crudHandler } from '~/server/utils/crud.handler'
import type { IProduct } from '~/types'

export default defineEventHandler(async (event) => {
  const { create } = await crudHandler(event)
  const data = await create<IProduct>()
  return { ...data }
})
