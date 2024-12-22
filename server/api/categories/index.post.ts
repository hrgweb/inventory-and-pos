import { serverSupabaseClient } from '#supabase/server'

export default defineEventHandler(async (event) => {
  const supabase = await serverSupabaseClient(event)
  const { name, ...body } = await readBody(event)

  // Check if category name already exists
  const { count, error } = await supabase
    .from('categories')
    .select('*', { count: 'exact', head: true })
    .eq('name', name)

  if (error) throw createError(error)

  // Exists
  if (count) {
    throw createError({
      statusCode: 400,
      statusMessage: 'Category name already exists'
    })
  }

  // Save to categories
  const { data, error: categoriesError } = await supabase
    .from('categories')
    .insert({ name, ...body })
    .select()

  if (categoriesError) throw createError(categoriesError)

  return data
})
