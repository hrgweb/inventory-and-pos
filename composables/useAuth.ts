interface ILoginError {
  code: string
  message: string
}

export function useAuth() {
  const _error = ref<ILoginError | null>(null)

  const supabase = useSupabaseClient()

  async function register(payload: { email: string; password: string }) {
    let { data, error } = await supabase.auth.signUp(payload)

    if (error) throw error

    return data
  }

  async function signIn({
    email,
    password
  }: {
    email: string
    password: string
  }) {
    const { data, error } = await supabase.auth.signInWithPassword({
      email,
      password
    })

    if (error) {
      _error.value = {
        code: error.code || 'unknown',
        message: error.message || 'An error occured'
      }
      throw error
    }

    return data
  }

  async function signOut() {
    let { error } = await supabase.auth.signOut()

    if (error) throw error

    return true
  }

  return { signIn, signOut, register, _error }
}
