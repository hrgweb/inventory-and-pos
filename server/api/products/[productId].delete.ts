import { serverSupabaseClient } from '#supabase/server'
import type { IProduct } from '~/types'

export default defineEventHandler(async (event) => {
  const supabase = await serverSupabaseClient(event)
  const productId = getRouterParam(event, 'productId') as string
  const body = {
    is_deleted: true
  } as Partial<IProduct>

  const { error } = await supabase
    .from('products')
    .update(body)
    .eq('id', productId)
    .select()

  if (error) throw createError(error)

  return true
})
