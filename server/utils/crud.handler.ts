import { serverSupabaseClient } from '#supabase/server'
import { H3Event, EventHandlerRequest, H3Error } from 'h3'

export async function crudHandler(event: H3Event<EventHandlerRequest>) {
  const client = await serverSupabaseClient(event)

  async function create<T>(table: string): Promise<T | null> {
    const body = await readBody(event)

    try {
      const { data, error } = await client.from(table).insert(body).select()

      if (error) {
        throw createError({
          statusCode: 500,
          statusMessage: error.message
        })
      }
      const result = data && data.length ? data[0] : data
      return result as T
    } catch (error) {
      throw createError({
        statusCode: 500,
        statusMessage: (error as Error).message
      })
    }
  }

  async function findAll<T>(
    table: string,
    select = '*'
  ): Promise<{ items: T[]; total: number }> {
    let page = 1
    let itemsPerPage = 10
    let totalCount = 0

    try {
      // First, get total count for pagination
      const { count } = await client
        .from('products')
        .select('*', { count: 'exact', head: true })

      const { data, error } = await client
        .from(table)
        .select(select)
        .order('id', { ascending: false })
        .range((page - 1) * itemsPerPage, page * itemsPerPage - 1)

      if (error) throw error

      totalCount = count || 0

      return {
        items: data as T[],
        total: totalCount
      }
    } catch (error) {
      throw createError({
        statusCode: 500,
        statusMessage: (error as Error).message
      })
    }
  }

  async function update<T>(table: string): Promise<T | null> {
    const productId = getRouterParam(event, 'productId')
    const body = (await readBody(event)) as never

    if (!productId) {
      throw createError({
        statusCode: 404,
        statusMessage: 'Product not found'
      })
    }

    try {
      const { data, error } = await client
        .from(table)
        .update(body)
        .eq('id', productId)
        .select()

      if (error) {
        throw createError({
          statusCode: 500,
          statusMessage: error.message
        })
      }

      const result = data && data.length ? data[0] : data
      return result as T
    } catch (error) {
      throw createError({
        statusCode: 500,
        statusMessage: (error as Error).message
      })
    }
  }

  return { create, findAll, update }
}
