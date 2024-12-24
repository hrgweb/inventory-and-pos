import { serverSupabaseClient } from '#supabase/server'
import * as _cache from './../../utils/cache.handler'

export default defineEventHandler(async (event) => {
  const supabase = await serverSupabaseClient(event)
  const { name, ...body } = await readBody(event)

  // Check if supplier name already exists
  const { count, error } = await supabase
    .from('suppliers')
    .select('*', { count: 'exact', head: true })
    .eq('name', name)

  if (error) throw createError(error)

  // Exists
  if (count) {
    throw createError({
      statusCode: 400,
      statusMessage: 'Supplier name already exists'
    })
  }

  // Save to suppliers
  const { data, error: categoriesError } = await supabase
    .from('suppliers')
    .insert({ name, ...body })
    .select()

  if (categoriesError) throw createError(categoriesError)

  // Remove cache
  await _cache.remove('suppliers')

  return data[0]
})
