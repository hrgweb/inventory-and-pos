<template>
  <div class="flex flex-col items-center space-y-3">
    <p>Please choose the type of scanner to be use.</p>

    <UButton
      class="w-[250px]"
      label="Use Webcam"
      icon="heroicons:finger-print-20-solid"
      color="gray"
      size="xl"
      @click="chooseWebcam"
    />
    <UButton
      class="w-[250px]"
      label="Use Barcode Scanner"
      icon="heroicons:viewfinder-circle"
      color="gray"
      size="xl"
      @click="chooseBarcodeScanner"
    />
  </div>
</template>

<script setup lang="ts">
const { chooseWebcam, chooseBarcodeScanner } = useProductBarcode()
</script>
