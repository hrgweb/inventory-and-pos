import { serverSupabaseClient } from '#supabase/server'

export default defineEventHandler(async (event) => {
  const client = await serverSupabaseClient(event)

  const query = getQuery(event)

  let page = (query?.page as number) || 1
  let itemsPerPage = 15
  let totalCount = 0
  const search = query?.search || ''

  // First, get total count for pagination
  const { count } = await client
    .from('products')
    .select('*', { count: 'exact', head: true })
    .ilike('name', `${search}%`)

  const { data, error } = await client
    .from('products')
    .select('*')
    .ilike('name', `${search}%`)
    .order('id', { ascending: false })
    .range((page - 1) * itemsPerPage, page * itemsPerPage - 1)

  if (error) throw error

  totalCount = count || 0

  return {
    items: data,
    total: totalCount
  }
})
