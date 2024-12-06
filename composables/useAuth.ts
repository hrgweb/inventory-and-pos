interface ILoginError {
  code: string
  message: string
}

export function useAuth() {
  const _error = useState<ILoginError | null>('auth_error', () => null)
  const aboutToSignout = useState('about_to_signout', () => false)

  const supabase = useSupabaseClient()

  async function register(payload: { email: string; password: string }) {
    let { data, error } = await supabase.auth.signUp(payload)

    if (error) throw createError(error)

    return data
  }

  async function signIn({
    email,
    password
  }: {
    email: string
    password: string
  }) {
    _error.value = null

    const { data, error } = await supabase.auth.signInWithPassword({
      email,
      password
    })

    if (error) throw createError(error)

    return data
  }

  async function signOut() {
    let { error } = await supabase.auth.signOut()

    if (error) throw createError(error)

    return true
  }

  return { signIn, signOut, register, _error, aboutToSignout }
}
