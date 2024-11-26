<template>
  <pre>{{ product }}</pre>

  <input
    v-model="barcode"
    class="py-1 px-2"
    type="text"
    ref="barcode_input"
    @input="onScan"
  />

  <div class="flex flex-col w-full h-screen">
    <div
      class="bg-slate-800 text-white text-8xl p-6 font-medium flex justify-end"
    >
      <SharedDisplayNumber :value="getTotal.toString() || '0'" />
    </div>

    <div class="uppercase text-4xl bg-slate-600 font-medium text-white p-3">
      My awesome store
    </div>

    <div class="flex bg-slate-200 flex-1">
      <div class="flex w-[70%]">
        <UTable
          :rows="items"
          :columns="columns"
          :ui="{ td: { padding: 'py-1' } }"
          class="overflow-y-auto w-full"
        >
          <template #item-data="{ row }">
            <span class="uppercase text-2xl text-slate-800">{{
              row.product.name
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
        <!-- TODO: will think what to put in here -->
      </div>
    </div>

    <UModal v-model="show_modal">
      <component :is="component_to_use" @close="modal = 'none'" />
    </UModal>
  </div>
</template>

<script setup lang="ts">
import { useFocus, useMagicKeys } from '@vueuse/core'
import TenderAmount from '~/components/transaction/TenderAmount.vue'

definePageMeta({ layout: 'none' })

const {
  barcode,
  findProduct,
  product,
  items,
  getTotal,
  aboutToPay,
  getOrCreateTransaction,
  fetchOrders
} = useTransaction()

type ModalValue = 'none' | 'form'

const qty = ref(1)

const {
  modal,
  showModal: show_modal,
  componentToUse: component_to_use
} = useModalCustom<ModalValue>()

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

async function onScan() {
  await findProduct({ barcode: barcode.value })
  barcode.value = ''
}

const barcode_input = ref()
const { focused } = useFocus(barcode_input, { initialValue: true })

const { ctrl, enter } = useMagicKeys()

// Open
watchEffect(() => {
  if (ctrl.value && enter.value) {
    aboutToPay.value = true
    modal.value = 'form'
    component_to_use.value = TenderAmount
  }
})

onBeforeMount(async () => {
  await getOrCreateTransaction()
  await fetchOrders()
})
</script>
