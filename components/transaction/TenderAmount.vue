<template>
  <UCard class="bg-slate-700">
    <UAlert
      v-if="error_msg"
      icon="i-heroicons-exclamation-triangle"
      class="mb-4"
      color="red"
      variant="soft"
      title=" Message!"
      :description="error_msg"
    />
    <div class="space-y-6">
      <!-- Total -->
      <div>
        <label for="amount" class="text-white text-2xl uppercase pb-1 block">
          Total</label
        >
        <input
          type="text"
          class="text-4xl p-6 relative block w-full disabled:cursor-not-allowed disabled:opacity-75 focus:outline-none border-0 form-input rounded-md placeholder-gray-400 dark:placeholder-gray-500 px-2.5 py-1.5 shadow-sm bg-white dark:bg-gray-900 text-gray-900 dark:text-white ring-1 ring-inset ring-gray-300 dark:ring-gray-700 focus:ring-2 focus:ring-primary-500 dark:focus:ring-primary-400"
          readonly
          :value="formatNumber(getTotal)"
        />
      </div>

      <!-- Amount -->
      <div>
        <label for="amount" class="text-white text-2xl uppercase pb-1 block">
          Amount</label
        >
        <input
          v-model.number="tender_amount"
          id="amount"
          ref="amount"
          type="text"
          class="text-4xl p-6 relative block w-full disabled:cursor-not-allowed disabled:opacity-75 focus:outline-none border-0 form-input rounded-md placeholder-gray-400 dark:placeholder-gray-500 px-2.5 py-1.5 shadow-sm bg-white dark:bg-gray-900 text-gray-900 dark:text-white ring-1 ring-inset ring-gray-300 dark:ring-gray-700 focus:ring-2 focus:ring-primary-500 dark:focus:ring-primary-400"
          :class="[error_msg ? 'focus:ring-red-500' : 'ring-1 ring-gray-300']"
        />
      </div>

      <!-- Change -->
      <div>
        <label for="amount" class="text-white text-2xl uppercase pb-1 block"
          >Change</label
        >
        <input
          type="text"
          class="text-4xl p-6 relative block w-full disabled:cursor-not-allowed disabled:opacity-75 focus:outline-none border-0 form-input rounded-md placeholder-gray-400 dark:placeholder-gray-500 px-2.5 py-1.5 shadow-sm bg-white dark:bg-gray-900 text-gray-900 dark:text-white ring-1 ring-inset ring-gray-300 dark:ring-gray-700 focus:ring-2 focus:ring-primary-500 dark:focus:ring-primary-400"
          readonly
          :value="formatNumber(getChange)"
        />
      </div>
    </div>
  </UCard>
</template>

<script setup lang="ts">
import { useFocus, useMagicKeys } from '@vueuse/core'
import { formatNumber } from '~/utils'

const {
  getTotal,
  aboutToPay,
  tenderAmount: tender_amount,
  getChange,
  createSales
} = useTransaction()

const amount = ref()
const { focused } = useFocus(amount, { initialValue: true })

const { enter, escape } = useMagicKeys()

const emit = defineEmits<{
  close: [void]
}>()

// Press ENTER and must be the modal tender amount is open
watchEffect(() => {
  if (aboutToPay.value && enter.value) {
    focused.value = true
    onPay()
  }
})

// Press ESC
watchEffect(() => {
  if (escape.value) {
    aboutToPay.value = false
    emit('close')
  }
})

const error_msg = ref('')

async function onPay(): Promise<void> {
  if (getTotal.value > tender_amount.value) {
    focused.value = true
    error_msg.value = 'Tendered amount was insufficient.'
    return
  }
  error_msg.value = ''
  await createSales() //save to sales
  emit('close')
}
</script>
