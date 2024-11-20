<template>
  <div class="flex relative">
    <img
      class="mr-4 rounded-lg"
      :src="product.thumbnail"
      :alt="product.product_name"
      :style="{ width: '200px', height: '150px' }"
    />
    <div class="flex flex-col space-y-3">
      <h3>{{ product.product_name }}</h3>
      <p>{{ product.description }}</p>

      <span>{{ product.price }}</span>
    </div>

    <div class="absolute right-0 top-0 flex gap-3">
      <Icon class="cursor-pointer text-xl" name="heroicons:eye" />
      <Icon class="cursor-pointer text-xl" name="heroicons:pencil" />
      <Icon
        class="cursor-pointer text-xl text-red-500"
        name="heroicons:trash"
      />
    </div>
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
