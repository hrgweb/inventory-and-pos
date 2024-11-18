<template>
  <div class="p-6">
    <AppPageTitle :title="page_title" />

    <ClientOnly>
      <ProductForm />
    </ClientOnly>

    <UModal v-model="show_modal">
      <ProductBarcode />
    </UModal>
  </div>
</template>

<script setup lang="ts">
import type { ProductHeaderTitle } from '~/types'
import ProductForm from '~/components/product/ProductForm.vue'
import ProductBarcode from '~/components/product/ProductBarcode.vue'

const page_title = ref<ProductHeaderTitle>('New Product')

const { modal } = useBarcode()

const show_modal = computed(() => (modal.value !== 'none' ? true : false))
</script>
