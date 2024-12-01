<template>
  <div class="p-6">
    <div class="flex items-center justify-between pb-6">
      <div class="flex justify-between items-center gap-4">
        <AppPageTitle title="Products" />
      </div>
    </div>

    <UTabs :items="items" class="w-full">
      <template #item="{ item }">
        <!-- All -->
        <div v-if="item.key === 'all'">
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

          <ProductTable @edit="onEdit" />
        </div>

        <!-- Categories -->
        <div v-else-if="item.key === 'categories'">
          <div class="flex justify-between items-center pt-3 pb-6">
            <UButton
              label="New Category"
              icon="heroicons:plus"
              @click="onNewCategory"
            />
            <UInput
              v-model="search"
              icon="i-heroicons-magnifying-glass"
              placeholder="Search for category"
              class="w-72"
              @update:model-value="categorySearch(search)"
            />
          </div>

          <CategoryTable @edit="onEditCategory" />
        </div>
      </template>
    </UTabs>
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

definePageMeta({ middleware: 'auth' })

const search = ref('')

const items = [
  {
    label: 'All',
    key: 'all',
    icon: '',
    content: 'This is the content shown for Tab1'
  },
  {
    label: 'Categories',
    key: 'categories',
    icon: '',
    content: 'And, this is the content for Tab2'
  }
]

const {
  isAdd: is_add_product,
  selected,
  fetchProducts,
  list,
  search: productSearch
} = useProduct()
const {
  search: categorySearch,
  fetchCategories,
  isAdd: is_add_category,
  selected: category_selected
} = useCategory()

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

function onNewCategory() {
  modal.value = 'category-form'
  is_add_category.value = true
}

function onEditCategory(category: ICategory) {
  modal.value = 'category-form'
  is_add_category.value = false
  category_selected.value = category
}

onBeforeMount(async () => {
  fetchCategories({ search: '' })
})

watchEffect(() => {
  list.value = []
  fetchProducts({ search: '' })
})
</script>
