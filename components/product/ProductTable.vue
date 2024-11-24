<template>
  <UCard>
    <UTable :rows="items" :columns="columns">
      <template #name-data="{ row }">
        <span>{{ row.name }}</span>
      </template>
      <template #price-data="{ row }">
        <span>{{ row.price_formatted }}</span>
      </template>
      <template #subtotal-data="{ row }">
        <span>{{ row.subtotal_formatted }}</span>
      </template>
      <template #actions-data="{ row }">
        <div class="flex gap-3">
          <Icon
            class="cursor-pointer text-xl text-orange-500"
            name="heroicons:pencil"
            @click="onEdit(row)"
          />
          <Icon
            class="cursor-pointer text-xl text-red-500"
            name="heroicons:trash"
          />
        </div>
      </template>
    </UTable>

    <UPagination
      v-model="page"
      :page-count="5"
      :total="listCount"
      @update:model-value="page = $event"
    />
  </UCard>
</template>

<script setup lang="ts">
import type { IProduct } from '~/types'

const { getProducts: items, list, fetchProducts, listCount } = useProduct()

const columns = [
  {
    key: 'name',
    label: 'Product'
  },
  {
    key: 'price',
    label: 'Price'
  },
  {
    key: 'qty',
    label: 'Qty'
  },
  {
    key: 'actions',
    label: 'Actions'
  }
]
const page = ref(1)

const emit = defineEmits<{
  edit: [product: IProduct]
}>()

function onEdit(product: IProduct) {
  emit('edit', product)
}

watchEffect(() => {
  list.value = []
  fetchProducts(page)
})
</script>
