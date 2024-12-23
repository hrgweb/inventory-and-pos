import { serverSupabaseClient } from '#supabase/server'
import { ICategory } from '~/types'
import * as _cache from './../../utils/cache.handler'

export default defineEventHandler(async (event) => {
  const supabase = await serverSupabaseClient(event)
  const query = getQuery(event)
  const search = (query?.search || '') as string

  // Check if data has cached
  const cacheData = (await _cache.get('categories')) as ICategory[]
  if (_cache.hasCached('categories', cacheData)) {
    // Search
    if (search) {
      return _cache.search(cacheData, 'name', search)
    }

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
