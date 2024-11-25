import { serverSupabaseClient } from '#supabase/server'
import { IProduct } from '~/types'

export default defineEventHandler(async (event) => {
  const query = getQuery(event)
  const barcode = (query?.barcode || '') as string

  const client = await serverSupabaseClient(event)
  try {
    const { data, error } = await client
      .from('products')
      .select('*')
      .like('barcode', barcode)

    if (error) throw error

    if (data && data.length) {
      return data[0] as IProduct
    }
  } catch (error) {
    throw error
  }
  return null
})
