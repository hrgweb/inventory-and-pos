export default defineNuxtRouteMiddleware(async (to) => {
  const user = useSupabaseSession()

  //   Not authenticated
  if (!user.value && to.path !== '/login') {
    return navigateTo('/login')
  }

  //   Authenticated and in the login page
  if (user.value && to.path === '/login') {
    return navigateTo('/pos')
  }
})
