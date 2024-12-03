<template>
  <div class="flex flex-col w-full h-screen p-3 space-y-3">
    <div
      class="flex bg-slate-50 items-center justify-between rounded-lg p-3 shadow w-full gap-6 px-6"
    >
      <h2 class="font-medium text-xl">Awesome Store</h2>

      <div class="relative w-[50%]">
        <Icon
          name="lucide:scan-barcode"
          class="absolute z-10 w-5 h-5 left-3 top-3.5 text-gray-400"
        />
        <input
          v-model="barcode"
          type="text"
          placeholder="Scan product barcode here "
          class="w-[500px] relative block w-full disabled:cursor-not-allowed disabled:opacity-75 focus:outline-none border-0 form-input placeholder-gray-400 dark:placeholder-gray-500 text-xl px-2.5 py-2.5 shadow-sm bg-white dark:bg-gray-900 text-gray-900 dark:text-white ring-1 ring-inset ring-gray-300 dark:ring-gray-700 focus:ring-2 focus:ring-gray-300 dark:focus:ring-gray-400 ps-9 rounded-full"
          ref="barcode_input"
          @input="onScan"
        />
      </div>

      <div>
        <!-- Go to admin -->
        <UButton
          icon="lucide:layout-dashboard"
          color="blue"
          variant="soft"
          class="rounded-full px-3 py-[.6rem]"
          to="/admin"
        />

        <!-- Signout -->
        <UButton
          icon="lucide:log-out"
          color="blue"
          variant="soft"
          class="rounded-full px-3 py-[.6rem]"
          @click="onSignOut"
        />
      </div>
    </div>

    <div class="flex flex-1 gap-3">
      <div class="space-y-3 flex flex-col">
        <UCard
          class="flex flex-[6] bg-slate-50 basis-0 overflow-y-auto"
          :ui="{
            body: { base: 'p-0 ' }
          }"
        >
          <UTable
            :rows="items"
            :columns="columns"
            :ui="{ base: 'w-full', td: { padding: 'py-1' } }"
          >
            <template #item-data="{ row }">
              <span class="text-lg">{{ row.product.name }}</span>
            </template>
            <template #qty-data="{ row }">
              <span class="text-lg">{{ row.qty }}</span>
            </template>
            <template #price-data="{ row }">
              <span class="text-lg">{{ row.product.selling_price }}</span>
            </template>
            <template #action-data="{ row, index }">
              <Icon
                name="lucide:trash"
                class="cursor-pointer text-xl text-red-500"
                @click="onRemove(row, index)"
              />
            </template>
            <template #empty-state>&nbsp;</template>
          </UTable>
        </UCard>

        <UCard
          class="flex flex-1 bg-slate-50 shrink-0"
          :ui="{
            body: { base: 'w-full ', padding: 'p-0' }
          }"
        >
          <div>
            <div
              class="flex justify-between items-center border-b border-slate-300 pb-4 text-slate-500"
            >
              <span class="text-lg">Sub Total:</span>
              <SharedDisplayNumber
                :value="getTotal.toString() || '0'"
                class="text-xl text-slate-500"
              />
            </div>
            <div
              class="flex justify-between items-center border-slate-300 py-4 text-slate-500"
            >
              <span class="text-xl font-semibold">Grand Total:</span>
              <SharedDisplayNumber
                :value="getTotal.toString() || '0'"
                class="text-xl text-slate-500 font-semibold"
              />
            </div>
          </div>
        </UCard>
      </div>

      <div class="shadow space-y-6 w-[400px] shrink-0 bg-zinc-200 rounded-lg">
        <UCard v-if="false" class="basis-0 overflow-y-auto">
          <div class="flex justify-between items-end">
            <span class="uppercase text-xl w-[150px] text-right pr-4"
              >item</span
            >
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
            <span class="uppercase text-xl w-[150px] text-right pr-4"
              >price</span
            >

            <SharedDisplayNumber
              :value="getProduct?.selling_price?.toString() || '0'"
              :show-currency="false"
              class="text-4xl bg-slate-800 text-white p-3 w-full text-right h-[70px]"
            />
          </div>
        </UCard>
      </div>
    </div>
  </div>

  <Teleport to="body">
    <UModal v-model="show_modal">
      <component :is="component_to_use" @close="modal = 'none'" />
    </UModal>
  </Teleport>
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
    class: 'text-slate-500 text-sm w-[500] shrnk-0',
    rowClass: 'text-left'
  },
  {
    key: 'qty',
    label: 'Qty',
    class: 'text-slate-500 text-sm w-[50px] text-center',
    rowClass: 'text-center w-20'
  },
  {
    key: 'price',
    label: 'Price',
    class: 'text-slate-500 text-sm w-[100px] text-center',
    rowClass: 'text-center w-28'
  },
  {
    key: 'action',
    label: '',
    class: 'text-slate-500 text-sm w-[50px]',
    rowClass: 'text-center w-10'
  }
]

const onScan = useDebounceFn(async () => {
  // Check if input characters are less than 10 then return
  if (barcode.value.length < 10) return

  await findProduct({ barcode: barcode.value })
  barcode.value = ''
}, 100)

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

const { signOut } = useAuth()

async function onSignOut() {
  await signOut()
  return navigateTo('/login')
}
</script>
