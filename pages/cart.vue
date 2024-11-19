<template>
  <div class="md:w-[900px] flex gap-6 my-6">
    <div class="flex-1">
      <UCard>
        <template #header>Order Summary</template>

        <pre>{{ orders }}</pre>

        <UTable :rows="orders" :columns="columns">
          <template #thumbnail-data="{ row }">
            <img :src="row.thumbnail"
          /></template>
          <template #title-data="{ row }">
            <span>{{ row.product_name }}</span>
          </template>
          <template #price-data="{ row }">
            <span>{{ row.price_formatted }}</span>
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

const { getItems: orders } = useCart()
</script>
