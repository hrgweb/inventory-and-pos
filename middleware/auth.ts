export default defineNuxtRouteMiddleware((to) => {
  const user = useSupabaseUser()

  console.log(user.value)

  //   Not authenticated
  if (!user.value && to.path !== '/login') {
    return navigateTo('/login')
  }

  //   Authenticated and in the login page
  if (user.value && to.path === '/login') {
    return navigateTo('/admin')
  }
})
