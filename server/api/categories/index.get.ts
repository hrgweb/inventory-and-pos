import { serverSupabaseClient } from '#supabase/server'

export default defineEventHandler(async (event) => {
  const supabase = await serverSupabaseClient(event)
  const query = getQuery(event)
  const search = query?.search || ''

  const { data: categories, error } = await supabase
    .from('categories')
    .select('id,name')
    .eq('is_deleted', false)
    .ilike('name', `${search}%`)
    .order('name', { ascending: true })

  if (error) throw createError(error)

  return categories
})
