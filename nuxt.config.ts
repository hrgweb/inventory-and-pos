// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  compatibilityDate: '2024-04-03',
  devtools: { enabled: true },
  modules: ['@nuxt/ui', '@vueuse/nuxt', '@nuxtjs/supabase', 'nuxt-gtag'],
  colorMode: {
    preference: 'light',
    fallback: 'light'
  }
  // gtag: {
  //   enabled: process.env.NODE_ENV === 'production'
  // }
})
