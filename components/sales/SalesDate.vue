<template>
  <UCard class="w-full">
    <UPopover :popper="{ placement: 'bottom-start' }" class="w-[250px]">
      <div class="flex gap-3 items-center">
        <span>Filter by date:</span>
        <UButton
          icon="i-heroicons-calendar-days-20-solid"
          :label="getDayLabel"
        />
      </div>

      <template #panel="{ close }">
        <AppDatePicker
          v-model="selected_date"
          is-required
          @close="close"
          @update:model-value="onDayClick"
        />
      </template>
    </UPopover>
  </UCard>
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
