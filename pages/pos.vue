<template>
  <UInput
    v-model="barcode"
    class="w-[250px] bg-slate-500"
    @update:model-value="onScan"
  />

  <div class="flex flex-col w-full h-screen">
    <div
      class="bg-slate-800 text-white text-8xl p-6 font-medium flex justify-end"
    >
      <SharedDisplayNumber :value="total.toString() || '0'" />
    </div>

    <div class="uppercase text-4xl bg-slate-600 font-medium text-white p-3">
      My awesome store
    </div>

    <div class="flex bg-slate-200 flex-1">
      <div class="flex w-[55%]">
        <UTable
          :rows="items"
          :columns="columns"
          :ui="{ td: { padding: 'py-1' } }"
          class="overflow-y-auto w-full"
        >
          <template #item-data="{ row }">
            <span class="uppercase text-2xl text-slate-800">{{
              row.name
            }}</span>
          </template>
          <template #qty-data="{ row }">
            <span class="uppercase text-2xl text-slate-800">{{ qty }}</span>
          </template>
          <template #price-data="{ row }">
            <span class="uppercase text-2xl text-slate-800">{{
              row.price
            }}</span>
          </template>
          <template #empty-state>&nbsp;</template>
        </UTable>
      </div>

      <div class="flex-1 shadow p-6 space-y-6">
        <div class="flex justify-between items-end">
          <span class="uppercase text-xl w-[100px] text-right pr-4">item</span>
          <span
            class="uppercase text-4xl bg-slate-800 text-white p-4 text-right w-full"
            >{{ product?.barcode }}</span
          >
        </div>
        <div class="flex justify-between items-end">
          <span class="uppercase text-xl w-[100px] text-right pr-4">qty</span>
          <span
            class="uppercase text-4xl bg-slate-800 text-white p-3 text-right w-full"
            >{{ qty }}</span
          >
        </div>
        <div class="flex justify-between items-end">
          <span class="uppercase text-xl w-[100px] text-right pr-4">price</span>
          <!-- <span
            class="uppercase text-4xl bg-slate-800 text-white p-3 text-right w-full"
            ></span
          > -->
          <SharedDisplayNumber
            :value="product?.price?.toString() || '0'"
            :show-currency="false"
            class="text-4xl bg-slate-800 text-white p-3 w-full text-right"
          />
        </div>
        <!-- <div class="flex justify-between items-end">
          <span class="uppercase text-xl w-[100px] text-right pr-4">total</span>

          <SharedDisplayNumber
            value="1500"
            :show-currency="false"
            class="text-4xl bg-slate-800 text-white p-3 w-full text-right"
          />
        </div> -->
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import { formatNumber } from '~/utils'

definePageMeta({ layout: 'none' })

const { barcode, findProduct, product, items, total } = useTransaction()

const qty = ref(1)

const columns = [
  {
    key: 'item',
    label: 'Item',
    class: 'w-[500px] shrink-0 text-lg'
  },
  {
    key: 'qty',
    label: 'Qty',
    class: 'text-lg text-center'
  },
  {
    key: 'price',
    label: 'Price',
    class: 'text-lg text-center'
  }
]

const { getItems } = useCart()

function updateQty(i: number, qty: number) {
  // items.value[i].qty = qty
  // items.value[i].subtotal = items.value[i].price! * qty
  // items.value[i].subtotal_formatted = formatNumber(items.value[i].price! * qty)
}

async function onScan() {
  await findProduct({ barcode: barcode.value })
}
</script>
