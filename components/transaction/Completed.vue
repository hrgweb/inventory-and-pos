<template>
  <div class="p-6 bg-slate-800 text-white rounded-lg space-y-6 text-center">
    <p class="text-2xl">Thank you for your order. Come again!</p>

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

const new_transaction_button = ref()
const { focused } = useFocus(new_transaction_button, { initialValue: true })

onMounted(() => (focused.value = true))
onUnmounted(() => (focused.value = false))

function onNewTransaction() {
  modal.value = 'none'
  reset()
}
</script>
