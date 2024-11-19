<template>
  <div class="p-6 flex gap-6">
    <img
      :src="product?.thumbnail"
      :alt="product?.product_name"
      :style="{ width: '200px', height: '250px' }"
    />
    <div class="flex flex-col">
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
const { product } = useStore()
</script>
