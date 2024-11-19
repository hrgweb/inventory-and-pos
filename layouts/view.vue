<template>
  <div class="bg-slate-300 text-slate-800">
    <!-- Navbar -->
    <div
      class="flex justify-between items-center bg-slate-500 text-white px-6 py-3"
    >
      <div class="flex gap-3">
        <NuxtLink v-for="(nav, i) in nav_options" :key="i" :to="`${nav.to}`">{{
          nav.label
        }}</NuxtLink>
      </div>

      <div class="flex items-center gap-6">
        <UInput
          v-model="search"
          class="md:w-96"
          size="xl"
          icon="heroicons:magnifying-glass"
          placeholder="Search"
        />

        <!-- Dropdown -->
        <UserMenu :is-show="is_show_menu" @click="onShow" />
      </div>
    </div>

    <div class="flex justify-center m-auto sm:w-full md:w-full lg:w-[1200px]">
      <div class="content flex-1 bg-slate-100">
        <slot />
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import type { INavigationOptions } from '~/types'
import UserMenu from '~/components/UserMenu.vue'

const nav_options = [
  {
    name: 'home',
    label: 'Home',
    icon: '',
    to: '/'
  },
  {
    name: 'shop',
    label: 'Shop',
    icon: '',
    to: '/shop'
  },
  {
    name: 'cart',
    label: 'Cart',
    icon: '',
    to: '/cart'
  },
  {
    name: 'barcode',
    label: 'Barcode',
    icon: '',
    to: '/barcode'
  }
] as INavigationOptions[]

const search = ref('')

const is_show_menu = ref(false)

function onShow() {
  is_show_menu.value = !is_show_menu.value
}
</script>
