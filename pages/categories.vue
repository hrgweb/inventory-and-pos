<template>
  <div class="p-6">
    <AppPageTitle title="Categories" />

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
  </div>
</template>

<script setup lang="ts">
import type { IProductCategory } from '~/types'

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
const categories = ref<IProductCategory[]>([
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
</script>
