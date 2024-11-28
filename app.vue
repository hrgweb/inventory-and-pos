<template>
  <pre>here: {{ settings }}</pre>

  <!-- Trial period alert -->
  <TrialPeriodAlert />

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
