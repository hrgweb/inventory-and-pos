<template>
  <div>
    <AppPageTitle title="Orders" />
  </div>
</template>

<script setup lang="ts">
definePageMeta({ middleware: 'auth' })
</script>
