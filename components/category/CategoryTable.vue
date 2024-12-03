<template>
  <UCard>
    <UTable :rows="items" :columns="columns" :ui="{ td: { padding: 'py-2' } }">
      <template #name-data="{ row }">
        <span>{{ row.name }}</span>
      </template>
      <template #actions-data="{ row, index }">
        <div class="flex gap-3">
          <Icon
            class="cursor-pointer text-xl text-zinc-400"
            name="lucide:pencil"
            @click="onEdit(row, index)"
          />

          <UPopover>
            <Icon
              class="cursor-pointer text-xl text-orange-400"
              name="lucide:trash"
            />

            <template #panel="{ close }">
              <div class="p-4">
                <p>
                  Delete <b>{{ row.name }}?</b>?
                </p>

                <div>
                  <UButton
                    label="Yes"
                    color="red"
                    @click="onDelete(row, index, close)"
                  />
                  <UButton
                    label="No"
                    color="white"
                    variant="ghost"
                    @click="close"
                  />
                </div>
              </div>
            </template>
          </UPopover>
        </div>
      </template>
    </UTable>
  </UCard>
</template>

<script setup lang="ts">
import type { ICategory } from '~/types'

const { list: items, selectedIndex, remove } = useCategory()

const columns = [
  {
    key: 'name',
    label: 'Category'
  },
  {
    key: 'actions',
    label: 'Actions',
    class: 'w-[100px]'
  }
]

const emit = defineEmits<{
  edit: [category: ICategory]
}>()

function onEdit(category: ICategory, index: number) {
  selectedIndex.value = index
  emit('edit', category)
}

const notification = useNotification()

async function onDelete(category: ICategory, index: number, close: () => void) {
  selectedIndex.value = index
  await remove(category?.id)
  notification.error({ title: 'Category removed successfully' })
  close()
}
</script>
