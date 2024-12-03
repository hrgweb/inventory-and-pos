import { serverSupabaseClient } from '#supabase/server'

export default defineEventHandler(async (event) => {
  const supabase = await serverSupabaseClient(event)
  const { barcode: _barcode } = getQuery(event)

  async function findProduct(barcode: string) {
    const { data, error } = await supabase
      .from('products')
      .select('id, name, selling_price, barcode')
      .like('barcode', barcode)

    if (error) throw error

    // No product found by barcode
    if (!data || data.length === 0) {
      throw createError({
        statusCode: 404,
        statusMessage: 'Product not found'
      })
    }

    // Check if data is an array
    if (Array.isArray(data)) {
      return data[0]
    }

    // Else object
    return data
  }

  try {
    // Find the product by barcode
    const product = await findProduct(_barcode as string)

    // No product found return null
    if (!product) return null

    return product
  } catch (error) {
    throw error
  }
})
