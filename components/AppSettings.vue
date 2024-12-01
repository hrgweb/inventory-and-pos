<template>
  <UForm
    :schema="schema"
    :state="state"
    class="space-y-4 w-[500px] pb-12"
    @submit="onSubmit"
  >
    <UFormGroup label="Trial Period" name="trial_period_days">
      <USelect
        v-model="state.trial_period_days"
        size="xl"
        :options="[
          { label: '30 Days', value: 30 },
          { label: '45 Days', value: 45 }
          // { label: '60 Days', value: 60 }
          // { label: '75 Days', value: 75 },
          // { label: '90 Days', value: 90 }
        ]"
        :disabled="settings ? true : false"
      />
    </UFormGroup>
    <UFormGroup label="Expiry Period" name="expiry_period">
      <input
        type="text"
        class="text-[16px] h-[45px] relative block w-full disabled:cursor-not-allowed disabled:opacity-75 focus:outline-none border-0 form-input rounded-md placeholder-gray-400 dark:placeholder-gray-500 px-2.5 py-1.5 shadow-sm bg-white dark:bg-gray-900 text-gray-900 dark:text-white ring-1 ring-inset ring-gray-300 dark:ring-gray-700 focus:ring-2 focus:ring-primary-500 dark:focus:ring-primary-400"
        readonly
        :value="expiry_period"
      />
    </UFormGroup>
    <div v-if="!settings" class="text-right">
      <UButton type="submit" size="lg">Save </UButton>
    </div>
  </UForm>
</template>

<script setup lang="ts">
import { z } from 'zod'
import type { FormSubmitEvent } from '#ui/types'
import type { TrialPeriodDays } from '~/types'
import { format } from 'date-fns'

const schema = z.object({
  trial_period_days: z.custom<TrialPeriodDays>()
})

type Schema = z.output<typeof schema>

interface State {
  trial_period_days: TrialPeriodDays
}

const state = reactive<State>({
  trial_period_days: 30
})

const { settings, create, update } = useSettings()
const notification = useNotification()

async function onSubmit(event: FormSubmitEvent<Schema>) {
  // Create settings
  if (!settings.value) {
    await create(event.data)
    notification.success({ title: 'Settings saved successfully' })
    return
  }

  // Update settings
  await update(event.data)
  notification.info({ title: 'Settings updated successfully' })
}

const expiry_period = computed(() => {
  if (settings.value && settings.value.trial_period_end) {
    return format(settings.value.trial_period_end, 'PPpp')
  }
  return ''
})

onMounted(() => {
  state.trial_period_days = settings.value?.trial_period_days || 30
})
</script>
