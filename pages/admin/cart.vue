<template>
  <div class="md:w-[1000px] flex gap-6 my-6">
    <div class="flex-1 overflow-auto">
      <UCard>
        <template #header>Cart ({{ items.length }})</template>

        <UTable :rows="items" :columns="columns">
          <template #thumbnail-data="{ row }">
            <img :src="row.thumbnail"
          /></template>
          <template #title-data="{ row }">
            <span>{{ row.product_name }}</span>
          </template>
          <template #price-data="{ row }">
            <span>{{ row.price_formatted }}</span>
          </template>
          <template #qty-data="{ row, index }">
            <SharedAdjustQty
              :qty="row.qty"
              @update="updateQty(index, $event)"
            />
          </template>
          <template #product_name-data="{ row }">
            <span>{{ row.product_name }}</span>
          </template>
          <template #subtotal-data="{ row }">
            <span>{{ row.subtotal_formatted }}</span>
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

    <div class="w-[300px] flex shrink-0">
      <UCard class="flex-1 space-y-3">
        <template #header>Order Summary</template>

        <div class="space-y-3">
          <div class="flex justify-between">
            <span>Sub Total:</span>
            <SharedDisplayNumber value="15" />
          </div>
          <div class="flex justify-between">
            <span>Delivery Fee:</span>
            <SharedDisplayNumber value="215" />
          </div>
        </div>
        <div class="flex justify-between py-6">
          <span class="text-xl">Grand Total:</span>
          <SharedDisplayNumber class="text-xl" value="215" />
        </div>

        <UButton
          class="w-full"
          icon="heroicons:shopping-cart"
          label="Proceed to Checkout"
          size="lg"
          color="blue"
        />
      </UCard>
    </div>
  </div>
</template>

<script setup lang="ts">
import type { IItem } from '~/types'
import { formatNumber } from '~/utils'

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
    key: 'subtotal',
    label: 'Subtotal'
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
  items.value[i].subtotal = items.value[i].price! * qty
  items.value[i].subtotal_formatted = formatNumber(items.value[i].price! * qty)
}
</script>
