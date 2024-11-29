export default defineNuxtRouteMiddleware((to) => {
  const user = useSupabaseUser()

  //   Not authenticated
  if (!user.value && to.path !== '/login') {
    return navigateTo('/login')
  }

  //   Authenticated and in the login page
  if (user.value && to.path === '/login') {
    return navigateTo('/admin')
  }
})
