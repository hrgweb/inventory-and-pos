<template>
  <p class="p-6">Redireting...</p>
</template>

<script setup lang="ts">
definePageMeta({ layout: 'none', middleware: 'auth' })

onMounted(async () => await navigateTo('/pos'))
</script>
