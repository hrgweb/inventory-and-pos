<template>
  <div class="flex flex-col w-full h-screen">
    <div
      class="bg-slate-800 text-white text-8xl p-6 font-medium flex justify-end"
    >
      <SharedDisplayNumber :value="getTotal.toString() || '0'" />
    </div>

    <div
      class="uppercase text-4xl bg-slate-600 font-medium text-white p-3 flex justify-between items-center"
    >
      <h3>My awesome store</h3>

      <!-- <div class="flex items-center">
        <span>Change:</span>
        <SharedDisplayNumber
          class="text-5xl font-semibold text-right pl-12"
          :value="change.toString() || '0'"
        />
      </div> -->
    </div>

    <div class="flex bg-slate-200 flex-1">
      <div class="flex w-[60%]">
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
            <span class="uppercase text-2xl text-slate-800">{{ row.qty }}</span>
          </template>
          <template #price-data="{ row }">
            <span class="uppercase text-2xl text-slate-800">{{
              row.product.selling_price
            }}</span>
          </template>
          <template #action-data="{ row, index }">
            <Icon
              name="heroicons:trash"
              class="cursor-pointer text-xl text-red-500"
              @click="onRemove(row, index)"
            />
          </template>
          <template #empty-state>&nbsp;</template>
        </UTable>
      </div>

      <div class="flex-1 shadow p-6 space-y-6">
        <div class="flex justify-between items-end">
          <span class="uppercase text-xl w-[150px] text-right pr-4">item</span>
          <input
            v-model="barcode"
            class="uppercase text-4xl bg-slate-800 text-white p-4 text-right w-full h-[70px]"
            type="text"
            ref="barcode_input"
            @input="onScan"
          />
        </div>
        <div class="flex justify-between items-end">
          <span class="uppercase text-xl w-[150px] text-right pr-4"
            >barcode</span
          >
          <span
            class="uppercase text-4xl bg-slate-800 text-white p-4 text-right w-full h-[70px]"
            >{{ getProduct?.barcode }}</span
          >
        </div>
        <div class="flex justify-between items-end">
          <span class="uppercase text-xl w-[150px] text-right pr-4">qty</span>
          <span
            class="uppercase text-4xl bg-slate-800 text-white p-3 text-right w-full h-[70px]"
            >{{ qty }}</span
          >
        </div>
        <div class="flex justify-between items-end">
          <span class="uppercase text-xl w-[150px] text-right pr-4">price</span>

          <SharedDisplayNumber
            :value="getProduct?.selling_price?.toString() || '0'"
            :show-currency="false"
            class="text-4xl bg-slate-800 text-white p-3 w-full text-right h-[70px]"
          />
        </div>
      </div>
    </div>
  </div>

  <Template to="body">
    <UModal v-model="show_modal">
      <component :is="component_to_use" @close="modal = 'none'" />
    </UModal>
  </Template>
</template>

<script setup lang="ts">
import { useFocus, useMagicKeys, useDebounceFn } from '@vueuse/core'
import TenderAmount from '~/components/transaction/TransactionTenderAmount.vue'
import Completed from '~/components/transaction/TransactionCompleted.vue'
import PriceLookup from '~/components/transaction/TransactionPriceLookup.vue'
import type { IOrderResponse, ModalValue } from '~/types'

definePageMeta({ layout: 'none', middleware: 'auth' })

const {
  barcode,
  findProduct,
  items,
  getTotal,
  aboutToPay,
  getOrCreateTransaction,
  fetchOrders,
  remove,
  change,
  completed: transaction_completed,
  transaction
} = useTransaction()

const {
  modal,
  showModal: show_modal,
  componentToUse: component_to_use
} = useModalCustom<ModalValue>()

const columns = [
  {
    key: 'item',
    label: 'Item',
    class: 'w-[500px] shrink-0 text-lg',
    rowClass: 'text-left'
  },
  {
    key: 'qty',
    label: 'Qty',
    class: 'text-lg text-center',
    rowClass: 'text-center  w-20'
  },
  {
    key: 'price',
    label: 'Price',
    class: 'text-lg text-center',
    rowClass: 'text-center w-28'
  },
  {
    key: 'action',
    label: '',
    class: 'text-lg text-center',
    rowClass: 'text-center w-10'
  }
]

const onScan = useDebounceFn(async () => {
  // Check if input characters are less than 10 then return
  if (barcode.value.length < 10) return

  await findProduct({ barcode: barcode.value })
  barcode.value = ''
}, 500)

const barcode_input = ref()
const { focused } = useFocus(barcode_input, { initialValue: true })

const { ctrl, enter, f } = useMagicKeys()

const notification = useNotification()

// Open the pay modal
watchEffect(() => {
  if (ctrl.value && enter.value) {
    if (items.value.length === 0) {
      notification.warning({
        title: 'No items',
        description: 'Please add an item first.'
      })
      return
    }

    aboutToPay.value = true
    modal.value = 'form'
  }
})

// Open modal for price lookup
watchEffect(() => {
  if (ctrl.value && f.value) {
    modal.value = 'lookup'
  }
})

watch(modal, (value) => {
  if (value === 'form') {
    component_to_use.value = TenderAmount
  }
  if (value === 'completed') {
    component_to_use.value = Completed
  }
  if (value === 'lookup') {
    component_to_use.value = PriceLookup
  }
  setTimeout(() => (focused.value = true), 500)
})

onBeforeMount(async () => {
  await getOrCreateTransaction()
  await fetchOrders()
})

const { selectedIndex, item, qty } = useOrder()

async function onRemove(order: IOrderResponse, index: number): Promise<void> {
  selectedIndex.value = index
  if (!order) return
  const removed = await remove(order.id!)
  if (removed) {
    items.value.splice(selectedIndex.value, 1)
  }
}

const getProduct = computed(() => item.value?.product)

watch(transaction_completed, () => {
  focused.value = true
})

onMounted(() => {
  document.addEventListener('click', focusToBarcoceInput)
})

function focusToBarcoceInput() {
  focused.value = true
}
</script>
