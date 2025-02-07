<template>
  <div>
    <div class="flex justify-between items-center pb-6">
      <AppPageTitle :title="`${isAdd ? 'New ' : 'Edit '} Product`" />

      <UButton
        class="rounded-full"
        color="white"
        icon="heroicons:x-mark-solid"
        variant="ghost"
        @click="onClose"
      />
    </div>

    <UForm :schema="schema" :state="form" class="space-y-4" @submit="onSubmit">
      <UFormGroup label="Category Name" name="name">
        <UInput v-model="form.name" size="xl" />
      </UFormGroup>

      <div class="text-left space-x-3">
        <UButton v-if="isAdd" type="submit" size="lg" label="Save Record" />
        <UButton
          v-else
          type="button"
          size="lg"
          label="Update Record"
          color="orange"
          @click="onUpdate"
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
import type { IProductFormRequest } from '~/types'

const { create, isAdd, selected, update } = useCategory()

const schema = z.object({
  name: z.string().min(1, { message: 'Product name is required' })
})

type Schema = z.output<typeof schema>

const state = reactive<IProductFormRequest>({
  name: ''
})

const editState = reactive<IProductFormRequest>({
  id: '',
  name: ''
})

function reset() {
  // Add
  state.name = ''

  // Edit
  editState.name = ''
}

const notification = useNotification()

async function onSubmit(event: FormSubmitEvent<Schema>) {
  const formData = {
    ...event.data,
    barcode_img: state.barcode_img
  }
  await create(formData) // save product
  notification.success({ title: 'Product saved successfully' })
  setTimeout(() => reset(), 100)
  onClose()
}

const emit = defineEmits<{
  close: [void]
}>()

function onClose() {
  isAdd.value = false
  emit('close')
}

const form = computed(() => (isAdd.value ? state : editState))

// Watch for the isAdd value
watchEffect(() => {
  if (isAdd.value) {
    console.log('add')
    return
  }

  // Edit
  const category = selected.value
  editState.id = category?.id
  editState.name = category?.name
})

async function onUpdate() {
  const product = editState
  await update(product)
  notification.info({ title: 'Product updated successfully' })
  emit('close')
}
</script>
