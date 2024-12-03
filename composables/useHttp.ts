type HttpMethod = 'GET' | 'POST' | 'PATCH' | 'PUT' | 'DELETE'

export function useHttp() {
  const isLoading = ref(false)

  async function create<T, B>(
    url: string,
    method: HttpMethod,
    body: B | null
  ): Promise<T> {
    isLoading.value = false

    try {
      const config = {
        method,
        headers: {
          ContentType: 'application/json',
          Accept: 'application/json'
        }
      } as Record<string, any>

      if (method === 'POST' || method === 'PATCH' || method === 'PUT') {
        config.body = JSON.stringify(body)
      }

      const data = await $fetch<T>(url, config)

      if (!data) {
        throw createError({
          statusCode: 500,
          statusMessage: 'Encountered an error'
        })
      }

      return data as T
    } catch (error) {
      throw error
    } finally {
      isLoading.value = true
    }
  }

  async function get<T>(
    url: string,
    query?: Record<string, any>
  ): Promise<T[]> {
    try {
      const config = {
        method: 'GET',
        headers: {
          ContentType: 'application/json',
          Accept: 'application/json'
        },
        query
      } as Record<string, any>

      const data = await $fetch<T[]>(url, config)

      return data as T[]
    } catch (error) {
      throw error
    }
  }

  async function getCustom<T>(
    url: string,
    query?: Record<string, any>
  ): Promise<T> {
    try {
      const data = await $fetch<T[]>(url, { method: 'GET', query })
      return data as T
    } catch (error) {
      throw error
    }
  }

  async function getOne<T>(
    url: string,
    query?: Record<string, any>
  ): Promise<T> {
    try {
      const data = await $fetch<T>(url, { method: 'GET', query })

      // Check if data is an array
      if (Array.isArray(data)) {
        return data[0] as T
      }

      // Check if data is an object
      if (typeof data === 'object' && data !== null) {
        return data as T
      }

      throw createError({
        statusCode: 500,
        statusMessage: 'Response must be an array or object'
      })
    } catch (error) {
      throw error
    }
  }

  async function post<T, B>(url: string, data: any) {
    return await create<T, B>(url, 'POST', data)
  }

  async function update<T, B>(url: string, data: any) {
    return await create<T, B>(url, 'PATCH', data)
  }

  async function remove<T>(url: string): Promise<T | null> {
    try {
      const data = await $fetch<T>(url, { method: 'DELETE' })
      return data as T
    } catch (error) {
      throw error
    }
  }

  return { get, getCustom, getOne, post, update, remove }
}
