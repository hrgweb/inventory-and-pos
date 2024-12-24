<template>
  <div>
    <AppPageTitle title="Reports" />
  </div>
</template>

<script setup lang="ts">
import AppPageTitle from '~/components/AppPageTitle.vue'
import * as Page from '~/constant/pageMeta.js'

useHead({ title: Page.ADMIN })
definePageMeta({ middleware: 'auth' })
</script>
