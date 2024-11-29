<template>
  <TrialPeriodAlert v-if="settings" :end-date="settings?.trial_period_end!" />

  <NuxtLayout>
    <NuxtPage />

    <UNotifications />
  </NuxtLayout>
</template>

<script setup lang="ts">
const { getSettings, settings } = useSettings()

onBeforeMount(async () => {
  await getSettings()
})
</script>
