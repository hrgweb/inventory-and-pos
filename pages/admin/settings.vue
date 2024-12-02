<template>
  <div>
    <AppPageTitle title="Settings" class="pb-6" />

    <AppSettings />
  </div>
</template>

<script setup lang="ts">
definePageMeta({ middleware: 'auth' })
</script>
