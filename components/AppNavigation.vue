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
    to: '/'
  },
  {
    name: 'categories',
    label: 'Categories',
    icon: '',
    to: '/categories'
  },
  {
    name: 'products',
    label: 'Products',
    icon: '',
    to: '/products'
  },
  {
    name: 'all_products',
    label: 'All Products',
    icon: '',
    to: '/all-products'
  },
  {
    name: 'payments',
    label: 'Payments',
    icon: '',
    to: '/payments'
  },
  {
    name: 'users',
    label: 'Users',
    icon: '',
    to: '/users'
  },
  {
    name: 'insights',
    label: 'Insights',
    icon: '',
    to: '/insights'
  },
  {
    name: 'settings',
    label: 'Settings',
    icon: '',
    to: '/settings'
  },
  {
    name: 'personal',
    label: 'Personal',
    icon: '',
    to: '/personal'
  },
  {
    name: 'upgrades',
    label: 'Upgrades',
    icon: '',
    to: '/upgrades'
  },
  {
    name: 'guides',
    label: 'Guides',
    icon: '',
    to: '/guides'
  },
  {
    name: 'trainings',
    label: 'Trainings',
    icon: '',
    to: '/trainings'
  },
  {
    name: 'logout',
    label: 'Logout',
    icon: '',
    to: '/logout'
  }
] as INavigationOptions[]
</script>
