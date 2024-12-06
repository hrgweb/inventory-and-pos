<template>
  <p class="p-6">Redireting...</p>
</template>

<script setup lang="ts">
import * as Page from '~/constant/pageMeta.js'

useHead({ title: Page.TITTLE })
definePageMeta({ layout: 'none', middleware: 'auth' })

onMounted(async () => await navigateTo('/pos'))
</script>
