<template>
  <div class="flex flex-col space-y-3 relative" :style="{ width: '190px' }">
    <img
      class="mr-4 rounded-lg"
      :src="product.thumbnail"
      :alt="product.product_name"
      :style="{ width: '100%', height: '150px' }"
    />
    <h3 class="cursor-pointer">{{ product.product_name }}</h3>

    <span class="text-orange-500">&#8369; {{ product.price_formatted }}</span>
  </div>
</template>

<script setup lang="ts">
import type { IProduct } from '~/types'

interface Props {
  product: IProduct
}

withDefaults(defineProps<Props>(), {
  product: () => ({} as IProduct)
})
</script>
