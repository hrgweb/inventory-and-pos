<template>
  <div
    class="p-6 flex justify-between gap-6 md:border-4 md:border-green-500 md:w-[900px]"
  >
    <img
      :src="product?.thumbnail"
      :alt="product?.product_name"
      :style="{ width: '400px', height: '400px' }"
    />
    <div class="flex flex-col border-4 border-red-500 flex-1">
      <h2 class="text-2xl font-medium">{{ product?.product_name }}</h2>
      <div class="flex justify-between">
        <span>Price</span>
        <span>{{ product?.price_formatted }}</span>
      </div>
      <div class="flex justify-between">
        <span>Available</span>
        <!-- TODO: replace how many is available -->
        <span>100</span>
      </div>
      <div class="flex justify-between">
        <span>Sold</span>
        <!-- TODO: replace how many is sold -->
        <span>0</span>
      </div>
      <div class="flex justify-between">
        <span>Share</span>
        <!-- TODO: social media links -->
        <span>social media links</span>
      </div>
      <div class="flex justify-between">
        <span>Copy Link</span>
        <UInput />
      </div>

      <UButton label="Add to Cart" color="green" icon="heroicons:cart" />
    </div>
  </div>
</template>

<script setup lang="ts">
definePageMeta({
  layout: 'view'
})
const { product } = useStore()
</script>
