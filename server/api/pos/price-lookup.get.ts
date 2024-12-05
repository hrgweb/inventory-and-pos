import { serverSupabaseClient } from '#supabase/server'

export default defineEventHandler(async (event) => {
  const supabase = await serverSupabaseClient(event)
  const { search } = getQuery(event)

  try {
    // Find the product by barcode
    return await findProduct(search as string)
  } catch (error) {
    throw error
  }

  async function findProduct(search: string) {
    const { data, error } = await supabase
      .from('products')
      .select('id, name, selling_price, barcode')
      .or(`name.ilike.${search}%,barcode.eq.${search}`)

    if (error) throw error

    // No product found by barcode
    if (!data || data.length === 0) {
      throw createError({
        statusCode: 404,
        statusMessage: 'Product not found'
      })
    }

    return data
  }
})
