<template>
  <div>
    <AppPageTitle title="Dashboard" />
  </div>
</template>

<script setup lang="ts">
import AppPageTitle from '~/components/AppPageTitle.vue'

definePageMeta({
  middleware: 'auth'
})
</script>
