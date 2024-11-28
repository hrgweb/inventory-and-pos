import { serverSupabaseClient } from '#supabase/server'

export default defineEventHandler(async (event) => {
  const client = await serverSupabaseClient(event)

  const { data, error } = await client.from('settings').select('*').limit(1)

  if (error) throw error

  return data && data.length ? data[0] : data
})
