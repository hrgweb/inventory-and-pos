<template>
  <div class="flex flex-col justify-center items-center space-y-6">
    <UAlert
      icon="i-heroicons-command-line"
      color="orange"
      variant="outline"
      title="Heads up!"
      description="Use your camera to scan the barcode."
    />

    <div
      id="media"
      class="border border-slate-200 rounded-lg"
      :style="{ width: '100%', height: '350px' }"
    ></div>

    <UInput
      class="w-full"
      placeholder="Type barcode here"
      icon="heroicons:finger-print-20-solid"
      size="xl"
    />

    <UButton
      label="Change Scanner"
      icon="heroicons:camera"
      color="blue"
      @click="choose"
    />

    <UCheckbox
      color="primary"
      label="Always use your webcam to scan barcode"
      :model-value="true"
    />
  </div>
</template>

<script setup lang="ts">
const { choose } = useBarcode()
</script>
