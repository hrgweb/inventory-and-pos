<template>
  <TrialPeriodAlert
    v-if="tenDaysBeforeExpiry"
    :end-date="settings?.trial_period_end!"
  />

  <NuxtLayout>
    <NuxtPage />

    <UNotifications />
  </NuxtLayout>
</template>

<script setup lang="ts">
const { settings } = useSettings()
const { tenDaysBeforeExpiry, getTrialPeriod, expired } = useTrialPeriod()

onBeforeMount(async () => {
  await getTrialPeriod()
})
</script>
