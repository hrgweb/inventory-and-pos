import { serverSupabaseClient } from '#supabase/server'
import type { IProduct } from '~/types'
import * as _cache from './../../utils/cache.handler'

export default defineEventHandler(async (event) => {
  const supabase = await serverSupabaseClient(event)
  const categoryId = getRouterParam(event, 'categoryId') as string
  const body = {
    is_deleted: true
  } as Partial<IProduct>

  const { error } = await supabase
    .from('categories')
    .update(body)
    .eq('id', categoryId)
    .select()

  if (error) throw createError(error)

  // Remove cache
  await _cache.remove('categories')

  return true
})
