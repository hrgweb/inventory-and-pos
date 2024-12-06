import { serverSupabaseClient } from '#supabase/server'
import { H3Event, EventHandlerRequest } from 'h3'

export async function crudHandler(event: H3Event<EventHandlerRequest>) {
  const client = await serverSupabaseClient(event)

  async function create<T>(table: string): Promise<T | null> {
    const body = await readBody(event)

    const { data, error } = await client.from(table).insert(body).select()

    if (error) throw createError(error)

    const result = data && data.length ? data[0] : data
    return result as T
  }

  async function createMany<T>(table: string): Promise<T[]> {
    const body = await readBody(event)
    const items = body.items

    const { data, error } = await client.from(table).insert(items).select()

    if (error) throw createError(error)

    return data as T[]
  }

  async function findAll<T>(
    table: string,
    select = '*',
    { columnToFilter = 'name' }: { columnToFilter: string }
  ): Promise<{ items: T[]; total: number }> {
    const query = getQuery(event)

    let page = (query?.page as number) || 1
    let itemsPerPage = 5
    let totalCount = 0
    const search = query?.search || ''

    // First, get total count for pagination
    const { count } = await client
      .from('products')
      .select('*', { count: 'exact', head: true })
      .ilike(columnToFilter, `${search}%`)

    const { data, error } = await client
      .from(table)
      .select(select)
      .ilike('name', `${search}%`)
      .order('id', { ascending: false })
      .range((page - 1) * itemsPerPage, page * itemsPerPage - 1)

    if (error) throw createError(error)

    totalCount = count || 0

    return {
      items: data as T[],
      total: totalCount
    }
  }

  async function findMany<T>(
    table: string,
    select = '*',
    {
      column,
      order,
      columnToFilter = 'name'
    }: { column: string; order: string; columnToFilter?: string }
  ): Promise<T[]> {
    const query = getQuery(event)
    const search = query?.search || ''

    const { data, error } = await client
      .from(table)
      .select(select)
      .ilike(columnToFilter, `${search}%`)
      .order(column, { ascending: order === 'asc' ? true : false })

    if (error) throw createError(error)

    return data as T[]
  }

  async function update<T>(
    table: string,
    paramIdName: string
  ): Promise<T | null> {
    const itemId = getRouterParam(event, paramIdName)
    const body = (await readBody(event)) as never

    if (!itemId) {
      throw createError({
        statusCode: 404,
        statusMessage: 'Item not found'
      })
    }

    const { data, error } = await client
      .from(table)
      .update(body)
      .eq('id', itemId)
      .select()

    if (error) throw createError(error)

    const result = data && data.length ? data[0] : data
    return result as T
  }

  async function remove<T>(table: string, paramIdName: string): Promise<T> {
    const itemId = getRouterParam(event, paramIdName)

    if (!itemId) {
      throw createError({
        statusCode: 404,
        statusMessage: 'Item not found'
      })
    }

    const { data, error } = await client.from(table).delete().eq('id', itemId)

    if (error) throw createError(error)

    return data as T
  }

  return { create, createMany, findAll, update, findMany, remove }
}
