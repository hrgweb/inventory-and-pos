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

  async function findAll<T>(table: string, select = '*'): Promise<T[]> {
    try {
      const { data, error } = await client.from(table).select(select)

      if (error) {
        throw createError({
          statusCode: 500,
          statusMessage: error.message
        })
      }

      return data as T[]
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
