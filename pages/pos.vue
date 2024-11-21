<template>
  <div class="flex flex-col w-full h-screen">
    <div
      class="bg-slate-800 text-white text-8xl p-6 font-medium flex justify-end"
    >
      <SharedDisplayNumber value="150" />
    </div>

    <div class="uppercase text-4xl bg-slate-600 font-medium text-white p-3">
      My awesome store
    </div>

    <div class="flex bg-slate-200 flex-1">
      <div class="w-[700px] flex">
        <UTable
          :rows="items"
          :columns="columns"
          :ui="{ td: { padding: 'py-1' } }"
          class="overflow-y-auto shrink-0"
        >
          <template #item-data="{ row }">
            <span class="uppercase text-2xl text-slate-800">{{
              row.product_name
            }}</span>
          </template>
          <template #qty-data="{ row }">
            <span class="uppercase text-2xl text-slate-800">{{ row.qty }}</span>
          </template>
          <template #subtotal-data="{ row }">
            <span class="uppercase text-2xl text-slate-800">{{
              row.subtotal_formatted
            }}</span>
          </template>
        </UTable>
      </div>

      <div class="flex-1 shadow p-6 space-y-6">
        <div class="flex justify-between items-end">
          <span class="uppercase text-xl w-[100px] text-right pr-4">item</span>
          <span
            class="uppercase text-4xl bg-slate-800 text-white p-4 text-right w-full"
            >248938483489343893</span
          >
        </div>
        <div class="flex justify-between items-end">
          <span class="uppercase text-xl w-[100px] text-right pr-4">qty</span>
          <span
            class="uppercase text-4xl bg-slate-800 text-white p-3 text-right w-full"
            >1</span
          >
        </div>
        <div class="flex justify-between items-end">
          <span class="uppercase text-xl w-[100px] text-right pr-4">price</span>
          <span
            class="uppercase text-4xl bg-slate-800 text-white p-3 text-right w-full"
            >150</span
          >
        </div>
        <div class="flex justify-between items-end">
          <span class="uppercase text-xl w-[100px] text-right pr-4">total</span>

          <SharedDisplayNumber
            value="1500"
            :show-currency="false"
            class="text-4xl bg-slate-800 text-white p-3 w-full text-right"
          />
        </div>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import type { IItem } from '~/types'
import { formatNumber } from '~/utils'

definePageMeta({ layout: 'none' })

const columns = [
  {
    key: 'item',
    label: 'Item',
    class: 'w-[500px] shrink-0 text-lg'
  },
  {
    key: 'qty',
    label: 'Qty',
    class: 'text-lg'
  },
  {
    key: 'subtotal',
    label: 'Subtotal',
    class: 'text-lg'
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
