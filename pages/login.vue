<template>
  <div class="h-screen pt-24">
    <UCard class="w-[400px] p-6 m-auto shadow-2xl bg-slate-50">
      <h3 class="text-2xl font-medium pb-6 text-slate-800">Sign In</h3>
      <UAlert
        v-if="_error"
        :title="_error?.message"
        variant="solid"
        color="red"
        class="pt-6 mb-6"
      />
      <UForm
        :schema="schema"
        :state="state"
        class="space-y-4"
        @submit="onSignIn"
      >
        <UFormGroup label="Email" name="email">
          <UInput v-model="state.email" />
        </UFormGroup>
        <UFormGroup label="Password" name="password">
          <UInput v-model="state.password" type="password" />
        </UFormGroup>
        <div class="pt-2">
          <UButton type="submit" :loading="is_loading"> Submit </UButton>
          <!-- <UButton
              type="button"
              variant="soft"
              color="white"
              @click="navigateTo('/register')"
              >Sign Up</UButton
            > -->
        </div>
      </UForm>
    </UCard>
  </div>
</template>

<script setup lang="ts">
import { z } from 'zod'
import type { FormSubmitEvent } from '#ui/types'

definePageMeta({
  layout: 'none',
  middleware: 'auth'
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

const { signIn, _error } = useAuth()

async function onSignIn(event: FormSubmitEvent<Schema>) {
  const data = await signIn(event.data)
  if (data) {
    await navigateTo('/admin')
  }
}

const { isLoading: is_loading } = useHttp()
</script>
