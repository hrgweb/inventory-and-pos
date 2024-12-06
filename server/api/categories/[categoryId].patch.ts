import { serverSupabaseClient } from '#supabase/server'

export default defineEventHandler(async (event) => {
  const supabase = await serverSupabaseClient(event)

  const { id, ...body } = await readBody(event)

  const { data, error } = await supabase
    .from('categories')
    .update(body as never)
    .eq('id', id)
    .select()

  if (error) throw createError(error)

  return data && data.length ? data[0] : data
})
