<template>
  <UPopover :popper="{ placement: 'bottom-start' }">
    <UButton icon="i-heroicons-calendar-days-20-solid" :label="getDayLabel" />

    <template #panel="{ close }">
      <AppDatePicker
        v-model="selected_date"
        is-required
        @close="close"
        @update:model-value="onDayClick"
      />
    </template>
  </UPopover>
</template>

<script setup lang="ts">
import { format, formatISO } from 'date-fns'

const { selectedDate: selected_date, fetchSales } = useSales()

async function onDayClick(day: Date) {
  await fetchSales({ day })
}

const getDayLabel = computed(() => {
  const d = selected_date.value
  return d ? format(d!, 'd MMM, yyy') : format(new Date(), 'd MMM, yyy')
})
</script>
