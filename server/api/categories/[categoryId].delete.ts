import { serverSupabaseClient } from '#supabase/server'
import type { IProduct } from '~/types'

export default defineEventHandler(async (event) => {
  const supabase = await serverSupabaseClient(event)
  const categoryId = getRouterParam(event, 'categoryId') as string
  const body = {
    is_deleted: true
  } as Partial<IProduct>

  console.log(categoryId)

  const { error } = await supabase
    .from('categories')
    .update(body)
    .eq('id', categoryId)
    .select()

  if (error) throw createError(error)

  return true
})
