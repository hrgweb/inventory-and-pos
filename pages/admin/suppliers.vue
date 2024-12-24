<template>
  <div>
    <div class="flex items-center justify-between pb-6">
      <AppPageTitle title="Suppliers" />
    </div>

    <div>
      <div class="flex justify-between items-center pt-3 pb-6">
        <UButton label="New Supplier" icon="heroicons:plus" @click="onNew" />
        <UInput
          v-model="search"
          icon="i-heroicons-magnifying-glass"
          placeholder="Search for supplier"
          class="w-72"
          @update:model-value="find('suppliers', search)"
        />
      </div>

      <SupplierTable @edit="onEdit" />
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
import SupplierForm from '~/components/supplier/SupplierForm.vue'
import CategoryForm from '~/components/category/CategoryForm.vue'
import type { ICategory, IProduct, ISupplier } from '~/types'
import * as Page from '~/constant/pageMeta'
import SupplierTable from '~/components/supplier/SupplierTable.vue'

useHead({ title: Page.ADMIN_PRODUCTS })
definePageMeta({ middleware: 'auth' })

const search = ref('')

const { is_add, selected, fetch, search: find, reset } = useSupplier()

type ModalValue = 'none' | 'form' | 'category-form'

const modal = ref<ModalValue>('none')
const component_to_use = shallowRef(SupplierForm)
const show_modal = computed(() => (modal.value !== 'none' ? true : false))

watchEffect(() => {
  switch (modal.value) {
    case 'form':
      component_to_use.value = SupplierForm
      break
    case 'category-form':
      component_to_use.value = CategoryForm
      break
  }
})

function onNew() {
  modal.value = 'form'
  is_add.value = true
}

function onEdit(supplier: ISupplier) {
  modal.value = 'form'
  is_add.value = false
  selected.value = supplier
}

onBeforeMount(async () => {
  fetch({ table: 'suppliers', search: '' })
})

onUnmounted(() => {
  reset()
})
</script>
