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
      />
    </UFormGroup>
    <div class="text-right">
      <UButton type="submit" size="lg">Save </UButton>
    </div>
  </UForm>
</template>

<script setup lang="ts">
import { z } from 'zod'
import type { FormSubmitEvent } from '#ui/types'
import type { TrialPeriodDays } from '~/types'

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

const { create } = useSettings()
const notification = useNotification()

async function onSubmit(event: FormSubmitEvent<Schema>) {
  await create(event.data)
  notification.success({ title: 'Settings saved successfully' })
}
</script>
