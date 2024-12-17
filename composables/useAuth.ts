interface ILoginError {
  code: string
  message: string
}

export function useAuth() {
  const _error = useState<ILoginError | null>('auth_error', () => null)
  const aboutToSignout = useState('about_to_signout', () => false)

  const supabase = useSupabaseClient()
  const log = useLog()

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
  }): Promise<void> {
    _error.value = null

    const { data, error } = await supabase.auth.signInWithPassword({
      email,
      password
    })

    if (error) {
      _error.value = {
        code: error.code || 'unknown',
        message: error.message || 'An error occured'
      }
      throw createError(error)
    }

    // Logger
    await log.create('signed_in', 'has signed in')

    // Redirect to admin
    await navigateTo('/admin')
  }

  async function signOut(): Promise<void> {
    let { error } = await supabase.auth.signOut()

    if (error) throw createError(error)

    // Redirect to login
    await navigateTo('/login')
  }

  return { signIn, signOut, register, _error, aboutToSignout }
}
