<template>
  <div class="flex flex-col space-y-3 p-6">
    <NuxtLink v-for="(nav, i) in nav_options" :key="i" :to="`${nav.to}`">{{
      nav.label
    }}</NuxtLink>
  </div>
</template>

<script setup lang="ts">
import type { INavigationOptions } from '~/types'

const nav_options = [
  {
    name: 'dashboard',
    label: 'Dashboard',
    icon: '',
    to: '/admin'
  },
  {
    name: 'products',
    label: 'Products',
    icon: '',
    to: '/admin/products'
  },
  {
    name: 'sales',
    label: 'Sales',
    icon: '',
    to: '/admin/sales'
  },

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
  {
    name: 'settings',
    label: 'Settings',
    icon: '',
    to: '/admin/settings'
  }
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
