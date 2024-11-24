import { serverSupabaseClient } from '#supabase/server'
import { H3Event, EventHandlerRequest, H3Error } from 'h3'

export async function crudHandler(event: H3Event<EventHandlerRequest>) {
  const client = await serverSupabaseClient(event)

  async function create<T>(): Promise<T | null> {
    const body = await readBody(event)

    try {
      // Categories
      const { data: category, error: categoryError } = await client
        .from('categories')
        .insert(body)

      // Products
      const { data, error } = await client
        .from('products')
        .insert(body)
        .select()

      if (error) {
        throw createError({
          statusCode: 500,
          statusMessage: error.message
        })
      }

      setResponseStatus(event, 201)
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

  return { create, findAll }
}
