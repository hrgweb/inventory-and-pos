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
      <template #actions-data>
        <div class="flex gap-3">
          <Icon
            class="cursor-pointer text-xl text-orange-500"
            name="heroicons:pencil"
          />
          <Icon
            class="cursor-pointer text-xl text-red-500"
            name="heroicons:trash"
          />
        </div>
      </template>
    </UTable>
  </UCard>
</template>

<script setup lang="ts">
const { getProducts: items } = useProduct()

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
</script>
