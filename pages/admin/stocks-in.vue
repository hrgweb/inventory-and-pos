<template>
  <div>
    <div class="flex items-center justify-between pb-6">
      <AppPageTitle title="Stocks-In" />
    </div>

    <div>
      <div class="flex justify-between items-center pt-3 pb-6">
        <UButton label="New Product" icon="heroicons:plus" @click="onNew" />
        <UInput
          v-model="search"
          icon="i-heroicons-magnifying-glass"
          placeholder="Search for product"
          class="w-72"
          @update:model-value="productSearch(search)"
        />
      </div>

      <StockInTable @edit="onEdit" />
    </div>
  </div>

  <Teleport to="#teleports">
    <UModal v-model="show_modal">
      <div class="p-6">
        <component :is="component_to_use" @close="modal = 'none'" />
      </div>
    </UModal>
  </Teleport>
</template>

<script setup lang="ts">
import ProductForm from '~/components/product/ProductForm.vue'
import CategoryForm from '~/components/category/CategoryForm.vue'
import type { ICategory, IProduct } from '~/types'
import * as Page from '~/constant/pageMeta'
import StockInTable from '~/components/stockin/StockInTable.vue'

useHead({ title: Page.ADMIN_PRODUCTS })
definePageMeta({ middleware: 'auth' })

const search = ref('')

const {
  isAdd: is_add_product,
  selected,
  fetchProducts,
  search: productSearch,
  reset: productReset
} = useProduct()
const { fetchCategories, reset: categoryReset } = useCategory()
const { fetch: fetchSuppliers } = useSupplier()

type ModalValue = 'none' | 'form' | 'category-form'

const modal = ref<ModalValue>('none')
const component_to_use = shallowRef(ProductForm)
const show_modal = computed(() => (modal.value !== 'none' ? true : false))

watchEffect(() => {
  switch (modal.value) {
    case 'form':
      component_to_use.value = ProductForm
      break
    case 'category-form':
      component_to_use.value = CategoryForm
      break
  }
})

function onNew() {
  modal.value = 'form'
  is_add_product.value = true
}

function onEdit(product: IProduct) {
  modal.value = 'form'
  is_add_product.value = false
  selected.value = product
}

onBeforeMount(async () => {
  fetchSuppliers({ table: 'suppliers', search: '' })
  fetchCategories({ search: '' })
  fetchProducts({ search: '' })
})

onUnmounted(() => {
  productReset()
  categoryReset()
})
</script>
