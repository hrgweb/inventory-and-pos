<template>
  <div class="p-6 bg-slate-800 text-white rounded-lg space-y-6 text-center">
    <p class="text-2xl">Thank you for your order. Come again!</p>

    <div class="flex-1 shadow p-6 space-y-6">
      <div class="flex justify-between items-center font-medium">
        <span class="uppercase text-4xl w-[150px] text-right pr-4">Total</span>
        <SharedDisplayNumber
          :value="total?.toString() || '0'"
          :show-currency="false"
          class="text-4xl bg-slate-800 text-white p-3 w-full text-right text-4xl"
        />
      </div>
      <div class="flex justify-between items-center">
        <span class="uppercase text-xl w-[150px] text-right pr-4">Amount</span>
        <SharedDisplayNumber
          :value="tender_amount?.toString() || '0'"
          :show-currency="false"
          class="text-3xl bg-slate-800 text-white p-3 w-full text-right"
        />
      </div>
      <div class="flex justify-between items-center">
        <span class="uppercase text-xl w-[150px] text-right pr-4">Change</span>

        <SharedDisplayNumber
          :value="change?.toString() || '0'"
          :show-currency="false"
          class="text-3xl bg-slate-800 text-white p-3 w-full text-right"
        />
      </div>
    </div>

    <UButton
      ref="new_transaction_button"
      label="New Transaction"
      size="xl"
      @click="onNewTransaction"
    />
  </div>
</template>

<script setup lang="ts">
import type { ModalValue } from '~/types'
import { useFocus } from '@vueuse/core'

const { modal } = useModalCustom<ModalValue>()
const { reset } = useTransaction()
const { tenderAmount: tender_amount, total, change } = useTransaction()

const new_transaction_button = ref()
const { focused } = useFocus(new_transaction_button, { initialValue: true })

onMounted(() => (focused.value = true))
onUnmounted(() => (focused.value = false))

function onNewTransaction() {
  modal.value = 'none'
  reset()
}
</script>
