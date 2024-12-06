import type { LogAction } from '~/types'

export function useLog() {
  const client = useSupabaseClient()

  async function create(action: LogAction, description: string) {
    const user = useSupabaseUser()?.value

    if (!user) throw createError('Not authenticated')

    const _description = (user as any).email + ' ' + description

    const body = {
      user_id: user.id,
      action,
      description: _description
    } as never

    const { data, error } = await client.from('logs').insert(body)

    if (error) throw createError(error)

    return data
  }

  return { create }
}
