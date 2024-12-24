<template>
  <div>
    <div class="flex justify-between items-center pb-6">
      <AppPageTitle :title="`${is_add ? 'New' : 'Edit'}  Supplier`" />

      <UButton
        class="rounded-full"
        color="white"
        icon="heroicons:x-mark-solid"
        variant="ghost"
        @click="onClose"
      />
    </div>

    <!-- Error -->
    <UAlert
      v-if="_errorMessage"
      icon="heroicons:exclamation-triangle"
      :description="`${
        _errorMessage && _errorMessage.includes('duplicate')
          ? 'Product already exists'
          : _errorMessage
      }`"
      title="Error"
      variant="solid"
      color="red"
      class="mb-4"
    />

    <UForm
      ref="productForm"
      :schema="schema"
      :state="form"
      class="space-y-4"
      @submit="onSubmit"
    >
      <UFormGroup label="Supplier Name" name="name" class="flex-1">
        <UInput v-model.string="form.name" size="xl" />
      </UFormGroup>
      <UFormGroup label="Address" name="address" class="flex-1">
        <UInput v-model.string="form.address" size="xl" />
      </UFormGroup>
      <UFormGroup label="Contact Person" name="contact_person" class="flex-1">
        <UInput v-model.string="form.contact_person" size="xl" />
      </UFormGroup>
      <UFormGroup label="Contact No" name="contact_no" class="flex-1">
        <UInput v-model.string="form.contact_no" size="xl" />
      </UFormGroup>

      <div class="text-left space-x-3 pt-6">
        <UButton
          type="submit"
          size="lg"
          :label="`${is_add ? 'Save' : 'Update'} Record`"
          :color="`${is_add ? 'green' : 'orange'}`"
          :loading="is_loading"
        />
        <UButton
          type="button"
          size="lg"
          label="Cancel"
          variant="ghost"
          color="white"
          @click="onClose"
        />
      </div>
    </UForm>
  </div>
</template>

<script setup lang="ts">
import { z } from 'zod'
import type { FormSubmitEvent } from '#ui/types'
import type { ISupplier } from '~/types'

const { create, is_add, selected, update } = useSupplier()

const schema = z.object({
  name: z.string().min(1, { message: 'Supplier name is required' }),
  contact_person: z.string().min(1, { message: 'Contact Person is required' }),
  address: z.string().min(1, { message: 'Address is required' }),
  contact_no: z.string().min(1, { message: 'Contact number is required' })
})

type Schema = z.output<typeof schema>

const state = reactive<Partial<ISupplier>>({
  name: '',
  contact_person: '',
  address: '',
  contact_no: ''
})

const editState = reactive<Partial<ISupplier>>({
  name: '',
  contact_person: '',
  address: '',
  contact_no: ''
})

function reset() {
  // Add
  state.name = ''
  state.contact_person = ''
  state.address = ''
  state.contact_no = ''

  // Edit
  editState.name = ''
  editState.contact_person = ''
  editState.address = ''
  editState.contact_no = ''
}

const emit = defineEmits<{
  close: [void]
}>()

const form = computed(() => (is_add.value ? state : editState))

// Watch for the is_add value
watchEffect(() => {
  if (is_add.value) {
    console.log('add')
    return
  }

  // Edit
  const supplier = selected.value
  editState.id = supplier?.id
  editState.name = supplier?.name
  editState.contact_person = supplier?.contact_person
  editState.address = supplier?.address
  editState.contact_no = supplier?.contact_no
})

async function onSubmit(event: FormSubmitEvent<Schema>) {
  // Create
  if (is_add.value) {
    const { ...body } = event.data
    await create('suppliers', body)
  }
  // Update
  else {
    const { ...body } = editState
    await update('suppliers', body)
  }

  if (!_errorMessage.value) {
    setTimeout(() => reset(), 100)
    onClose()
  }
}

function onClose() {
  emit('close')
}

const { isLoading: is_loading, _errorMessage } = useHttp()
</script>
