import { serverSupabaseClient } from '#supabase/server'

export default defineEventHandler(async (event) => {
  const client = await serverSupabaseClient(event)
  const storage = useStorage('redis')

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

  // Clear cached once searching
  // if (search) {
  //   storage.removeItem('products')
  //   console.log('product: cache cleared')
  // }

  // Check if data has cached
  const cachedData = await storage.getItem('products')
  if (cachedData) {
    console.log('product: from cached')
    return cachedData
  }

  console.log('product: not cached yet')

  // Not cached yet

  // Fetch products
  const { data, error } = await client
    .from('products')
    .select('*')
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

  // Without caching on search result
  // if (search) {
  //   return result
  // }

  // Cache data
  await storage.setItem('products', result)

  return result
})
