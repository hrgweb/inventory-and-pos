<template>
  <div class="p-6">
    <div
      class="flex items-center justify-between border-b border-slate-200 pb-6"
    >
      <AppPageTitle title="All Products" />

      <UInput
        v-model="search"
        class="w-72"
        size="md"
        icon="i-heroicons-magnifying-glass"
        placeholder="Search for product name"
      />
    </div>

    <div class="flex gap-6 py-3">
      <div class="flex gap-3 items-center">
        <span>Sort by:</span>
        <USelect v-model="sort_by" :options="sort_by_options" />
      </div>

      <div class="flex gap-3 items-center">
        <span>Filter by category:</span>
        <USelect v-model="filter_by" :options="filter_by_options" />
      </div>
    </div>

    <div class="flex flex-col space-y-12 pt-6">
      <ProductItem
        v-for="product in products"
        :key="product.id"
        :product="product"
      />
    </div>
  </div>
</template>

<script setup lang="ts">
import type { IProduct, ProductSortBy } from '~/types'

const search = ref('')
const sort_by = ref<ProductSortBy>('Latest Added')
const sort_by_options = ref<string[]>(['Latest Added', 'Product Name'])
const filter_by = ref('')

// TODO: Get from API and its type
const filter_by_options = ref<unknown[]>([])

const IMAGE = 'https://loremflickr.com/1280/720'

const products = ref<IProduct[]>([
  {
    id: 1,
    product_name: 'Shampoo',
    description: 'This is a shampoo',
    supplier_price: 12,
    mark_up: '%',
    price: 75,
    thumbnail: IMAGE,
    image: null
  },
  {
    id: 2,
    product_name: 'Foods',
    description: 'This is a shampoo',
    supplier_price: 12,
    mark_up: '%',
    price: 75,
    thumbnail: IMAGE,
    image: null
  },
  {
    id: 3,
    product_name: 'Tanduay',
    description: 'This is a shampoo',
    supplier_price: 12,
    mark_up: '%',
    price: 75,
    thumbnail: IMAGE,
    image: null
  }
])
</script>
