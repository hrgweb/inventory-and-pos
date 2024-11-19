<template>
  <div class="md:w-[900px] flex gap-6 my-6">
    <div class="flex-1">
      <UCard>
        <template #header>Cart ({{ items.length }})</template>

        <pre>{{ items }}</pre>

        <UTable :rows="items" :columns="columns">
          <template #thumbnail-data="{ row }">
            <img :src="row.thumbnail"
          /></template>
          <template #title-data="{ row }">
            <span>{{ row.product_name }}</span>
          </template>
          <template #price-data="{ row, index }">
            <SharedAdjustQty
              :qty="row.qty"
              @update="updateQty(index, $event)"
            />
          </template>
          <template #product_name-data="{ row }">
            <span>{{ row.product_name }}</span>
          </template>
          <template #actions-data>
            <div class="flex gap-3">
              <Icon
                class="cursor-pointer text-xl text-red-500"
                name="heroicons:trash"
              />
            </div>
          </template>
        </UTable>
      </UCard>
    </div>

    <div class="w-[400px]">
      <UCard>
        <template #header>Order Summary</template>
      </UCard>
    </div>
  </div>
</template>

<script setup lang="ts">
import type { IItem } from '~/types'

definePageMeta({
  layout: 'view'
})

const columns = [
  {
    key: 'thumbnail',
    label: 'Thumbnail'
  },
  {
    key: 'product_name',
    label: 'Product Name'
  },
  {
    key: 'price',
    label: 'Price'
  },
  {
    key: 'qty',
    label: 'Quantity'
  },
  {
    key: 'actions',
    label: 'Actions'
  }
]

const items = ref<IItem[]>([])

const { getItems } = useCart()

watchEffect(() => {
  items.value = getItems.value
  console.log('items: ', items.value)
})

function updateQty(i: number, qty: number) {
  items.value[i].qty = qty
}
</script>
