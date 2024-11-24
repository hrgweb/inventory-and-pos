<template>
  <div class="p-6">
    <div class="flex items-center justify-between pb-6">
      <div class="flex justify-between items-center gap-4">
        <AppPageTitle title="Products" />
        <UButton label="New Product" icon="heroicons:plus" @click="onNew" />
      </div>

      <UInput
        v-model="search"
        icon="i-heroicons-magnifying-glass"
        placeholder="Search for product"
        class="w-72"
        @update:model-value="onSearch"
      />
    </div>

    <ClientOnly>
      <ProductTable @edit="onEdit" />
    </ClientOnly>

    <UModal v-model="show_modal">
      <div class="p-6">
        <component :is="component_to_use" @close="modal = 'none'" />
      </div>
    </UModal>
  </div>
</template>

<script setup lang="ts">
import ProductForm from '~/components/product/ProductForm.vue'
import ProductBarcode from '~/components/product/ProductBarcode.vue'
import type { IProduct } from '~/types'
import { useDebounceFn } from '@vueuse/core'

const { isAdd, selected, fetchCategories, fetchProducts, list, page } =
  useProduct()

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
  isAdd.value = true
}

function onEdit(product: IProduct) {
  modal.value = 'form'
  isAdd.value = false
  selected.value = product
}

onBeforeMount(async () => {
  fetchCategories()
})

watchEffect((onCleanup) => {
  list.value = []
  fetchProducts({ search: '' })
})

const search = ref('')
const onSearch = useDebounceFn(async () => {
  list.value = []
  console.log('searched...', search.value)
  await fetchProducts({ search: search.value })
}, 500)

// const { modal } = useBarcode()
// const show_modal = computed(() => (modal.value !== 'none' ? true : false))
</script>
