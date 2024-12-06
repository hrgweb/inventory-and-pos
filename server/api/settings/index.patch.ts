import { serverSupabaseClient } from '#supabase/server'

export default defineEventHandler(async (event) => {
  const supabase = await serverSupabaseClient(event)
  const { id, ...body } = await readBody(event)

  // Update settings
  const { error } = await supabase
    .from('settings')
    .update(body as never)
    .eq('id', id)

  if (error) throw createError(error)

  return true
})
