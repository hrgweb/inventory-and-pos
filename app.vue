<template>
  <NuxtLayout>
    <NuxtPage />

    <UNotifications />
  </NuxtLayout>

  <Teleport to="body">
    <TrialPeriodAlert
      v-if="tenDaysBeforeExpiry && !expired"
      :end-date="settings?.trial_period_end!"
    />
  </Teleport>
</template>

<script setup lang="ts">
const { settings } = useSettings()
const { tenDaysBeforeExpiry, getTrialPeriod, expired } = useTrialPeriod()

onBeforeMount(async () => {
  await getTrialPeriod()
})
</script>
