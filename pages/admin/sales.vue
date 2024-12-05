<template>
  <div class="space-y-3">
    <div class="flex items-center justify-between pb-6">
      <div class="flex justify-between items-center gap-3">
        <AppPageTitle title="Sales" />
        <UBadge color="blue" variant="solid">{{ sales.length }}</UBadge>
      </div>
    </div>

    <SalesDate />
    <SalesTable />
  </div>
</template>

<script setup lang="ts">
definePageMeta({ middleware: 'auth' })

const { list: sales, fetchSales, reset: salesReset } = useSales()

onBeforeMount(async () => {
  await fetchSales({ day: undefined })
})

onUnmounted(() => salesReset())
</script>
