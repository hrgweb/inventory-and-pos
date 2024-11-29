export default defineNuxtRouteMiddleware(async (to) => {
  const { expired, getTrialPeriod } = useTrialPeriod()

  if (to.path !== '/trial-expired') {
    await getTrialPeriod()

    // Trial period expired
    if (expired.value) {
      return navigateTo('/trial-expired')
    }
  }
})
