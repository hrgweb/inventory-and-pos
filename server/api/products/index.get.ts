import { serverSupabaseClient } from '#supabase/server'
import { ICategory } from '~/types'
import * as _cache from './../../utils/cache.handler'

export default defineEventHandler(async (event) => {
  const client = await serverSupabaseClient(event)
  const query = getQuery(event)

  let page = (query?.page as number) || 1
  let itemsPerPage = 50
  let totalCount = 0
  const search = (query?.search || '') as string

  // First, get total count for pagination
  const { count, error: countError } = await client
    .from('products')
    .select('*', { count: 'exact', head: true })
    .eq('is_deleted', false)
    .ilike('name', `${search}%`)

  if (countError) {
    return {
      items: [],
      total: 0
    }
  }

  // Remove cached
  _cache.remove('products')

  // Check if data has cached
  const cacheData = (await _cache.get('products')) as ICategory[]
  if (_cache.hasCached('products', cacheData)) {
    // Search
    // if (search) {
    //   return _cache.search(cacheData, 'name', search)
    // }
    return cacheData
  }

  // Fetch products
  const { data, error } = await client
    .from('products')
    .select(
      `
*,
suppliers (
  id,
  name
)
      `
    )
    .eq('is_deleted', false)
    .ilike('name', `${search}%`)
    .order('id', { ascending: false })
    .range((page - 1) * itemsPerPage, page * itemsPerPage - 1)

  if (error) throw createError(error)

  totalCount = count || 0

  const result = {
    items: data,
    total: totalCount
  }

  // Cache data
  await _cache.set('products', result)

  return result
})
