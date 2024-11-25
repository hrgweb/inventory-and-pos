<template>
  <div class="p-6">
    <div class="flex items-center justify-between pb-6">
      <div class="flex justify-between items-center gap-4">
        <AppPageTitle title="Categories" />
        <UButton label="New Category" icon="heroicons:plus" @click="onNew" />
      </div>

      <UInput
        v-model="search"
        icon="i-heroicons-magnifying-glass"
        placeholder="Search for category"
        class="w-72"
        @update:model-value="onSearch"
      />
    </div>

    <ClientOnly>
      <CategoryTable @edit="onEdit" />
    </ClientOnly>

    <UModal v-model="show_modal">
      <div class="p-6">
        <component :is="component_to_use" @close="modal = 'none'" />
      </div>
    </UModal>
  </div>
</template>

<script setup lang="ts">
import type { ICategory } from '~/types'
import { useDebounceFn } from '@vueuse/core'
import CategoryForm from '~/components/category/CategoryForm.vue'

const { isAdd, selected, fetchCategories, list } = useCategory()

type ModalValue = 'none' | 'form'

const modal = ref<ModalValue>('none')
const component_to_use = shallowRef(CategoryForm)
const show_modal = computed(() => (modal.value !== 'none' ? true : false))

watchEffect(() => {
  switch (modal.value) {
    case 'form':
      CategoryForm
  }
})

function onNew() {
  modal.value = 'form'
  isAdd.value = true
}

function onEdit(category: ICategory) {
  modal.value = 'form'
  isAdd.value = false
  selected.value = category
}

onBeforeMount(async () => {
  await fetchCategories({ search: '' })
})

watchEffect(() => {
  list.value = []
  // fetchProducts({ search: '' })
})

const search = ref('')
const onSearch = useDebounceFn(async () => {
  list.value = []
  // page.value = 1
  await fetchCategories({ search: search.value })
}, 500)
</script>
