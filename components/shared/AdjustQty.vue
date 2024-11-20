<template>
  <div class="flex">
    <UButton label="-" color="red" variant="solid" @click="decrement" />
    <UInput
      v-model.number="qty"
      class="w-11 text-center"
      @update:model-value="emit('update', qty!)"
    />
    <UButton label="+" color="green" variant="solid" @click="increment" />
  </div>
</template>

<script setup lang="ts">
const qty = defineModel('qty', {
  type: Number
})

const emit = defineEmits<{
  update: [value: number]
}>()

function increment() {
  qty.value!++
  console.log(qty.value)
  emit('update', qty.value!)
}

function decrement() {
  if (qty.value! <= 1) {
    return 1
  }

  qty.value!--
  console.log(qty.value)
  emit('update', qty.value!)
}
</script>
