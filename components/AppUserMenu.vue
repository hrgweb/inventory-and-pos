<template>
  <div class="flex items-center gap-2 cursor-pointer relative">
    <Icon name="heroicons:user-20-solid" />
    <span>John Doe</span>

    <UCard v-if="isShow" class="absolute top-12 right-0 w-48">
      <div class="flex flex-col space-y-3">
        <NuxtLink v-for="(nav, i) in nav_options" :key="i" :to="`${nav.to}`">{{
          nav.label
        }}</NuxtLink>
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
    to: '/logout'
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
</script>
