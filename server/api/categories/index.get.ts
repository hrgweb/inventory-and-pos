import { serverSupabaseClient } from '#supabase/server'
import * as _cache from './../../utils/cache.handler'

export default defineEventHandler(async (event) => {
  const supabase = await serverSupabaseClient(event)
  const query = getQuery(event)
  const search = query?.search || ''

  // Check if data has cached
  const cacheData = await _cache.get('categories')
  if (_cache.hasCached('categories', cacheData)) {
    return cacheData
  }

  const { data: categories, error } = await supabase
    .from('categories')
    .select('id,name')
    .eq('is_deleted', false)
    .ilike('name', `${search}%`)
    .order('name', { ascending: true })

  if (error) throw createError(error)

  // Cache data
  await _cache.set('categories', categories)

  return categories
})
