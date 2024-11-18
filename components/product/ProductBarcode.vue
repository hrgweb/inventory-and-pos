<template>
  <UCard class="w-full">
    <template #header>
      <div class="flex items-center justify-between space-y-3">
        <span></span>

        <span class="text-center">Search Item by Barcode</span>

        <UButton
          icon="heroicons:x-mark"
          variant="soft"
          color="gray"
          class="rounded-full"
          @click="closeModal"
        />
      </div>
    </template>

    <component :is="componentToUse" />
  </UCard>
</template>

<script setup lang="ts">
const { modal, componentToUse, closeModal } = useBarcode()
</script>
