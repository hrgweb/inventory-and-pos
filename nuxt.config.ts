// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  compatibilityDate: '2024-04-03',
  devtools: { enabled: true },
  modules: ['@nuxt/ui', '@vueuse/nuxt', '@nuxtjs/supabase', 'nuxt-gtag'],
  supabase: {
    url: process.env.SUPABASEL_URL,
    key: process.env.SUPABASE_KEY,
    serviceKey: process.env.SUPABASE_SERVICE_KEY,
    redirect: false,
    redirectOptions: {
      login: '/login',
      callback: '/confirm',
      include: undefined,
      exclude: ['/pos'],
      cookieRedirect: false
    }
  },
  colorMode: {
    preference: 'light',
    fallback: 'light'
  }
  // gtag: {
  //   enabled: process.env.NODE_ENV === 'production'
  // }
})
