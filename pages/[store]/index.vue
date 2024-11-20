<template>
  <div class="p-6">
    <h2 class="text-center text-xl font-medium pb-12">
      Welcome to {{ name }} store
    </h2>

    <div class="flex gap-6 flex-wrap justify-center">
      <StoreItem
        v-for="product in getProducts"
        :key="product.id"
        :product="product"
      />
    </div>
  </div>
</template>

<script setup lang="ts">
const { name, getProducts } = useStore()
</script>
