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
    <div>
      <label for="amount" class="text-white text-2xl uppercase pb-2 block"
        >Enter Amount</label
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
  </UCard>
</template>

<script setup lang="ts">
import { useFocus, useMagicKeys } from '@vueuse/core'

const { getTotal, aboutToPay } = useTransaction()

const amount = ref<HTMLInputElement | null>()

const { focused } = useFocus(amount)

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

const tender_amount = ref(0)
const error_msg = ref('')

async function onPay(): Promise<void> {
  if (getTotal.value > tender_amount.value) {
    error_msg.value = 'Tendered amount was insufficient.'
    return
  }
  error_msg.value = ''
  emit('close')
}
</script>
