import type { ILog, LogAction } from '~/types'

export function useLog() {
  const client = useSupabaseClient()

  async function create(action: LogAction, description: string) {
    const body = {
      user_id: useSupabaseUser().value?.id,
      action,
      description
    } as never

    const { data, error } = await client.from('logs').insert(body)

    if (error) throw createError(error)

    return data
  }

  return { create }
}
