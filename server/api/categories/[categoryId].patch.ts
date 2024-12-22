import { serverSupabaseClient } from '#supabase/server'
import * as _cache from './../../utils/cache.handler'

export default defineEventHandler(async (event) => {
  const supabase = await serverSupabaseClient(event)

  const { id, ...body } = await readBody(event)

  const { data, error } = await supabase
    .from('categories')
    .update(body as never)
    .eq('id', id)
    .select()

  if (error) throw createError(error)

  // Remove cache
  await _cache.remove('categories')

  return data && data.length ? data[0] : data
})
