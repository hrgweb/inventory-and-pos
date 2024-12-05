<template>
  <div class="flex flex-col bg-white shadow rounded-lg px-6 py-4 gap-4">
    <p
      v-if="display_date"
      class="bg-slate-800 text-white text-center p-3 rounded-lg"
    >
      {{ display_date }}
    </p>

    <div class="flex gap-2">
      <!-- Date -->
      <SalesDate />
      <span class="px-3">or</span>
      <!-- Daily -->
      <UButton
        :disabled="loading_daily"
        label="Daily"
        color="gray"
        class="px-4"
        @click="onDaily"
      />
      <!-- Weekly -->
      <UButton
        :disabled="loading_weekly"
        label="Weekly"
        color="gray"
        class="px-4"
        @click="onWeekly"
      />
      <!-- Monthly -->
      <UButton
        :disabled="loading_monthly"
        label="Monthly"
        color="gray"
        class="px-4"
        @click="onMonthly"
      />
      <!-- Yearly -->
      <UButton
        :disabled="loading_yearly"
        label="Yearly"
        color="gray"
        class="px-4"
        @click="onYearly"
      />
    </div>
  </div>
</template>

<script setup lang="ts">
import { format, subDays, subMonths, subYears } from 'date-fns'

const { fetchSales, selectedDate: selected_date } = useSales()

watch(selected_date, (d) => {
  display_date.value = format(d!, 'd MMM, yyy')
})

const loading_daily = ref(false)
const loading_weekly = ref(false)
const loading_monthly = ref(false)
const loading_yearly = ref(false)

type DateType = 'daily' | 'weekly' | 'monthly' | 'yearly'

const date_type = ref<DateType>('daily')
const display_date = ref('')

function getSelectedDateLabel(date: Date): string {
  if (!date) return ''
  if (!date_type.value) return ''

  let d = ''
  const current_date = format(date, 'MMM d, yyy')

  switch (date_type.value) {
    case 'daily':
      d = current_date
      break
    case 'weekly':
      const start_wl = format(subDays(date, 7), 'MMM d, yyy')
      const end_wl = current_date
      d = `${start_wl} - ${end_wl}`
      break
    case 'monthly':
      const start_mo = format(subMonths(date, 1), 'MMM d, yyy')
      const end_mo = current_date
      d = `${start_mo} - ${end_mo}`
      break
    case 'yearly':
      const start_yr = format(subYears(date, 1), 'MMM d, yyy')
      const end_yr = current_date
      d = `${start_yr} - ${end_yr}`
      break
  }
  return d
}

async function onDaily(): Promise<void> {
  date_type.value = 'daily'
  loading_daily.value = true
  const day = new Date()
  display_date.value = getSelectedDateLabel(day)
  await fetchSales({ day })
  loading_daily.value = false
}

async function onWeekly() {
  date_type.value = 'weekly'
  loading_daily.value = true
  const start = subDays(Date.now(), 7)
  const end = new Date()
  display_date.value = getSelectedDateLabel(end)
  await fetchSales({ day: undefined, range: { start, end } })
  loading_daily.value = false
}

async function onMonthly() {
  date_type.value = 'monthly'
  loading_daily.value = true
  const day = new Date()
  display_date.value = getSelectedDateLabel(day)
  const start = subMonths(Date.now(), 1)
  const end = new Date()
  display_date.value = getSelectedDateLabel(end)
  await fetchSales({ day: undefined, range: { start, end } })
  loading_daily.value = false
}

async function onYearly() {
  date_type.value = 'yearly'
  loading_daily.value = true
  const day = new Date()
  display_date.value = getSelectedDateLabel(day)
  const start = subYears(Date.now(), 1)
  const end = new Date()
  display_date.value = getSelectedDateLabel(end)
  await fetchSales({ day: undefined, range: { start, end } })
  loading_daily.value = false
}
</script>
