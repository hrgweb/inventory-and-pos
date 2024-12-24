import { serverSupabaseClient } from '#supabase/server'
import * as _cache from './../../utils/cache.handler'

export default defineEventHandler(async (event) => {
  const supabase = await serverSupabaseClient(event)
  const supplierId = getRouterParam(event, 'supplierId') as string

  const { error } = await supabase
    .from('suppliers')
    .delete()
    .eq('id', supplierId)

  if (error) throw createError(error)

  // Remove cache
  await _cache.remove('suppliers')

  return true
})
