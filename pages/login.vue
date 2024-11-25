<template>
  <div class="w-[400px] p-6 m-auto">
    <UForm :schema="schema" :state="state" class="space-y-4" @submit="onSignIn">
      <UFormGroup label="Email" name="email">
        <UInput v-model="state.email" />
      </UFormGroup>
      <UFormGroup label="Password" name="password">
        <UInput v-model="state.password" type="password" />
      </UFormGroup>
      <UButton type="submit"> Submit </UButton>
    </UForm>
  </div>
</template>

<script setup lang="ts">
import { z } from 'zod'
import type { FormSubmitEvent } from '#ui/types'

definePageMeta({
  layout: 'none'
})

const schema = z.object({
  email: z
    .string({ required_error: 'Email is required' })
    .email('Please provide a valid email'),
  password: z
    .string({ required_error: 'Password is required' })
    .min(8, 'Must be at least 8 characters')
})

type Schema = z.output<typeof schema>

const state = reactive({
  email: undefined,
  password: undefined
})

async function onSignIn(event: FormSubmitEvent<Schema>) {
  const supabase = useSupabaseClient()
  const { email, password } = { ...event.data }

  const { data, error } = await supabase.auth.signInWithPassword({
    email,
    password
  })

  if (error) {
    throw error
  }

  console.log(data)
}
</script>
