import { serverSupabaseClient } from '#supabase/server'

export default defineEventHandler(async (event) => {
  const supabase = await serverSupabaseClient(event)
  const body = await readBody(event)

  const { data, error } = await supabase.from('products').insert(body).select()

  if (error) throw error

  return data && data.length ? data[0] : data
})
