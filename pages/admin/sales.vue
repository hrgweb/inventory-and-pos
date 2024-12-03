<template>
  <div>
    <div class="flex items-center justify-between pb-6">
      <div class="flex justify-between items-center gap-4">
        <AppPageTitle title="Sales" />
      </div>
    </div>

    <pre>{{ list }}</pre>

    <SalesTable />
  </div>
</template>

<script setup lang="ts">
definePageMeta({ middleware: 'auth' })

const { list, fetchSales } = useSales()

onBeforeMount(async () => {
  // await fetchSales()
})
</script>
