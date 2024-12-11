import { serverSupabaseClient } from '#supabase/server'

export default defineEventHandler(async (event) => {
  const supabase = await serverSupabaseClient(event)
  const orderId = getRouterParam(event, 'orderId')

  if (!orderId) {
    throw createError({
      statusCode: 500,
      statusMessage: `Order id ${orderId} not found`
    })
  }

  const { error } = await supabase.from('orders').delete().eq('id', orderId)

  if (error) throw createError(error)

  return true
})
