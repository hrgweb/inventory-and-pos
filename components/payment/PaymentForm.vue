<template>
  <UForm :schema="schema" :state="state" class="space-y-4" @submit="onSubmit">
    <UFormGroup label="Bank Name" name="bank_name">
      <UInput v-model="state.bank_name" size="xl" />
    </UFormGroup>
    <UFormGroup label="Account Name" name="account_name">
      <UInput v-model="state.account_name" size="xl" />
    </UFormGroup>
    <UFormGroup label="Account Number" name="account_number">
      <UInput v-model="state.account_number" size="xl" />
    </UFormGroup>
    <UFormGroup label="Account Details" name="account_details">
      <UTextarea v-model="state.account_details" />
    </UFormGroup>

    <UButton label="Save" type="submit" />
  </UForm>
</template>

<script setup lang="ts">
import { z } from 'zod'
import type { FormSubmitEvent } from '#ui/types'

const schema = z.object({
  bank_name: z.string().min(1),
  account_name: z.string().min(1),
  account_number: z.string().min(1),
  account_details: z.string()
})

type Schema = z.output<typeof schema>

const state = reactive({
  bank_name: '',
  account_name: '',
  account_number: '',
  account_details: ''
})

async function onSubmit(event: FormSubmitEvent<Schema>) {
  // Do something with data
  console.log(event.data)
}
</script>
