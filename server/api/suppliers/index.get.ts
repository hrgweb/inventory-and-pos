import { serverSupabaseClient } from '#supabase/server'
import { ICategory } from '~/types'
import * as _cache from './../../utils/cache.handler'

export default defineEventHandler(async (event) => {
  const supabase = await serverSupabaseClient(event)
  const query = getQuery(event)
  const search = (query?.search || '') as string

  // Check if data has cached
  const cacheData = (await _cache.get('suppliers')) as ICategory[]
  if (_cache.hasCached('suppliers', cacheData)) {
    // Search
    if (search) {
      return _cache.search(cacheData, 'name', search)
    }

    return cacheData
  }

  const { data: suppliers, error } = await supabase
    .from('suppliers')
    .select('*')
    .ilike('name', `${search}%`)
    .order('name', { ascending: true })

  if (error) throw createError(error)

  // Cache data
  await _cache.set('suppliers', suppliers)

  return suppliers
})
