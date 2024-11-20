<template>
  <div class="p-6">
    <div class="flex items-center justify-between">
      <AppPageTitle title="Categories" />

      <UButton
        label="New Category"
        icon="heroicons:plus"
        @click="is_show = true"
      />
    </div>

    <UTable :rows="categories" :columns="columns">
      <template #name-data="{ row }"
        ><span>{{ row.name }}</span></template
      >
      <template #actions-data>
        <div class="flex gap-3">
          <Icon class="cursor-pointer text-xl" name="heroicons:pencil" />
          <Icon
            class="cursor-pointer text-xl text-red-500"
            name="heroicons:trash"
          />
        </div>
      </template>
    </UTable>

    <!-- Modal - form -->
    <UModal v-model="is_show">
      <UCard class="w-full">
        <template #header>
          <div class="flex items-center justify-between">
            <span>{{ modal_title }}</span>

            <UButton
              icon="heroicons:x-mark"
              variant="soft"
              color="gray"
              class="rounded-full"
              @click="is_show = false"
            />
          </div>
        </template>
        <UForm
          :schema="schema"
          :state="state"
          class="space-y-4"
          @submit="onSubmit"
        >
          <UFormGroup label="Category Name" name="name">
            <UInput v-model="state.name" size="xl" />
          </UFormGroup>

          <UButton label="Save" type="submit" />
        </UForm>
      </UCard>
    </UModal>
  </div>
</template>

<script setup lang="ts">
import type { ICategory } from '~/types'
import { z } from 'zod'
import type { Form, FormSubmitEvent } from '#ui/types'

const schema = z.object({
  name: z.string().min(1)
})

type Schema = z.output<typeof schema>

const state = reactive({
  name: ''
})

async function onSubmit(event: FormSubmitEvent<Schema>) {
  // Do something with data
  console.log(event.data)
}

type FormTitle = 'New Category' | 'Update Category'

const modal_title = ref<FormTitle>('New Category')

const columns = [
  {
    key: 'name',
    label: 'Name'
  },
  {
    key: 'description',
    label: 'Description'
  },
  {
    key: 'actions',
    label: 'Actions'
  }
]

// TODO: Fetch categories from API
const categories = ref<ICategory[]>([
  {
    id: 1,
    name: 'Category 1'
  },
  {
    id: 2,
    name: 'Category 2'
  },
  {
    id: 3,
    name: 'Category 3'
  }
])

const is_show = ref(true)
</script>
