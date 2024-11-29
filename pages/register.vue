<template>
  <div class="w-[400px] p-6 m-auto">
    <UForm
      :schema="schema"
      :state="state"
      class="space-y-4"
      @submit="onRegister"
    >
      <UFormGroup label="Email" name="email">
        <UInput v-model="state.email" />
      </UFormGroup>
      <UFormGroup label="Password" name="password">
        <UInput v-model="state.password" type="password" />
      </UFormGroup>
      <div>
        <UButton type="submit" label="Save" />
      </div>
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

const { register } = useAuth()

async function onRegister(event: FormSubmitEvent<Schema>) {
  const data = await register(event.data)
  if (data) {
    await navigateTo('/')
    reset()
  }
}

function reset() {
  state.email = undefined
  state.password = undefined
}

onMounted(() => reset())
</script>
