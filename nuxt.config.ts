// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  compatibilityDate: '2024-04-03',
  devtools: { enabled: true },
  modules: ['@nuxt/ui', '@vueuse/nuxt', '@nuxtjs/supabase'],
  supabase: {
    url: process.env.SUPABASE_URL,
    key: process.env.SUPABASE_KEY,
    serviceKey: process.env.SUPABASE_SERVICE_KEY,
    redirect: false
    // redirectOptions: {
    //   login: '/login',
    //   callback: '/confirm',
    //   include: undefined,
    //   // exclude: ['/admin/*', '/pos', '/register'],
    //   exclude: ['/register'],
    //   cookieRedirect: false
    // }
  }
})
