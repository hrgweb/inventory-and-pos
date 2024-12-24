<template>
  <div class="flex flex-col px-12 py-8 relative h-full">
    <a href="/admin" class="text-2xl font-medium">Store</a>
    <br />

    <NuxtLink v-for="(nav, i) in nav_options" :key="i" :to="`${nav.to}`">
      <div class="flex items-center gap-3 px-3 py-3">
        <Icon class="w-5 h-5" :name="nav.icon" />
        <span>{{ nav.label }}</span>
      </div>
    </NuxtLink>

    <!-- Developer -->
    <div
      class="absolute bottom-1 left-1 right-1 rounded-md bg-slate-800 text-white p-3"
    >
      <p class="text-[10px]">
        Made with ❤️ by <span class="font-medium">Hergen Roque Gamayon</span>
      </p>
    </div>
  </div>
</template>

<script setup lang="ts">
import type { INavigationOptions } from '~/types'

const nav_options = [
  {
    name: 'dashboard',
    label: 'Dashboard',
    icon: 'lucide:layout-dashboard',
    to: '/admin'
  },
  {
    name: 'products',
    label: 'Products',
    icon: 'lucide:briefcase-business',
    to: '/admin/products'
  },
  {
    name: 'sales',
    label: 'Sales',
    icon: 'lucide:dollar-sign',
    to: '/admin/sales'
  },
  {
    name: 'suppliers',
    label: 'Suppliers',
    icon: 'lucide:file-terminal',
    to: '/admin/suppliers'
  },
  {
    name: 'stocks_in',
    label: 'Stocks-In',
    icon: 'lucide:file-terminal',
    to: '/admin/stocks-in'
  },
  {
    name: 'stocks_out',
    label: 'Stocks-Out',
    icon: 'lucide:file-terminal',
    to: '/admin/stocks-out'
  },
  {
    name: 'cashiers',
    label: 'Cashiers',
    icon: 'lucide:file-terminal',
    to: '/admin/cashiers'
  },
  {
    name: 'reports',
    label: 'Reports',
    icon: 'lucide:file-terminal',
    to: '/admin/reports'
  }
  // {
  //   name: 'all_products',
  //   label: 'All Products',
  //   icon: '',
  //   to: '/admin/all-products'
  // },
  // {
  //   name: 'payments',
  //   label: 'Payments',
  //   icon: '',
  //   to: '/admin/payments'
  // },
  // {
  //   name: 'users',
  //   label: 'Users',
  //   icon: '',
  //   to: '/admin/users'
  // },
  // {
  //   name: 'insights',
  //   label: 'Insights',
  //   icon: '',
  //   to: '/admin/insights'
  // },
  // {
  //   name: 'settings',
  //   label: 'Settings',
  //   icon: 'lucide:settings',
  //   to: '/admin/settings'
  // }
  // {
  //   name: 'personal',
  //   label: 'Personal',
  //   icon: '',
  //   to: '/admin/personal'
  // },
  // {
  //   name: 'upgrades',
  //   label: 'Upgrades',
  //   icon: '',
  //   to: '/admin/upgrades'
  // },
  // {
  //   name: 'guides',
  //   label: 'Guides',
  //   icon: '',
  //   to: '/admin/guides'
  // },
  // {
  //   name: 'trainings',
  //   label: 'Trainings',
  //   icon: '',
  //   to: '/admin/trainings'
  // },
  // {
  //   name: 'logout',
  //   label: 'Logout',
  //   icon: '',
  //   to: '/admin/logout'
  // }
] as INavigationOptions[]
</script>

<style>
.router-link-active {
  @apply bg-blue-500 text-white rounded-lg shadow-lg;
}
</style>
