<template>
  <div class="p-6">
    <div class="flex items-center pb-6 gap-4">
      <AppPageTitle title="Products" />

      <UButton label="New Product" icon="heroicons:plus" @click="onNew" />
    </div>

    <ProductTable />

    <UModal v-model="show_modal">
      <!-- <ProductBarcode /> -->

      <div class="p-6">
        <component :is="component_to_use" @close="modal = 'none'" />
      </div>
    </UModal>
  </div>
</template>

<script setup lang="ts">
import ProductForm from '~/components/product/ProductForm.vue'
import ProductBarcode from '~/components/product/ProductBarcode.vue'

type ModalValue = 'none' | 'form'

const modal = ref<ModalValue>('none')
const component_to_use = shallowRef(ProductForm)
const show_modal = computed(() => (modal.value !== 'none' ? true : false))

watchEffect(() => {
  switch (modal.value) {
    case 'form':
      return ProductForm
  }
})

function onNew() {
  modal.value = 'form'
}

// const { modal } = useBarcode()
// const show_modal = computed(() => (modal.value !== 'none' ? true : false))
</script>
