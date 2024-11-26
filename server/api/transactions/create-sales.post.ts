import { serverSupabaseClient } from '#supabase/server'

export default defineEventHandler(async (event) => {
  const client = await serverSupabaseClient(event)

  const body = await readBody(event)

  console.log(body)

  try {
    const { data, error } = await client.from('').insert(body).select()

    if (error) {
      throw createError({
        statusCode: 500,
        statusMessage: error.message
      })
    }

    const result = data && data.length ? data[0] : data
    return result
  } catch (error) {
    throw error
  }
})
