<template>
  <div
    class="flex items-center gap-2 cursor-pointer relative text-slate-800 z-10"
  >
    <div class="flex items-center gap-4">
      <UAvatar alt="John Doe" size="md" />
      <div class="flex flex-col">
        <!-- <h3 class="text-md font-semibold">{{ useSupabaseUser().value?.email }}</h3> -->
        <span class="text-sm font-light">{{
          useSupabaseUser()?.value?.email
        }}</span>
      </div>
      <Icon name="lucide:chevron-down" />
    </div>

    <UCard v-if="isShow" class="absolute top-14 right-0 w-48">
      <div class="flex flex-col space-y-3">
        <NuxtLink
          v-for="(nav, i) in nav_options"
          :key="i"
          :to="`${nav.to}`"
          @click.prevent="onNavClick(nav)"
        >
          <span class="text-sm">{{ nav.label }}</span>
        </NuxtLink>
      </div>
    </UCard>
  </div>
</template>

<script setup lang="ts">
import type { INavigationOptions } from '~/types'

const nav_options = [
  {
    name: 'my_profile',
    label: 'My Profile',
    icon: '',
    to: '/admin/profile'
  },
  {
    name: 'logout',
    label: 'Logout',
    icon: '',
    to: ''
  }
] as INavigationOptions[]

withDefaults(
  defineProps<{
    isShow: boolean
  }>(),
  {
    isShow: false
  }
)

const { signOut } = useAuth()

async function onNavClick(nav: INavigationOptions) {
  if (nav.name === 'logout') {
    await signOut()
    return navigateTo('/login')
  }
}
</script>
