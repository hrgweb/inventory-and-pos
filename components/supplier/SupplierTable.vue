<template>
  <UCard>
    <UTable
      :loading="is_loading"
      :rows="list"
      :columns="columns"
      :ui="{ td: { padding: 'py-2' } }"
    >
      <template #name-data="{ row }">
        <span>{{ row.name }}</span>
      </template>
      <template #contact_person-data="{ row }">
        <span>{{ row.contact_person }}</span>
      </template>
      <template #actions-data="{ row, index }">
        <div class="flex gap-3 justify-center">
          <Icon
            class="cursor-pointer text-xl text-zinc-400 bg-orange-500"
            name="lucide:pencil"
            @click="onEdit(row, index)"
          />

          <UPopover>
            <Icon
              class="cursor-pointer text-xl text-red-400"
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
import type { ISupplier } from '~/types'

const { list, selected_index, remove } = useSupplier()

const columns = [
  {
    key: 'name',
    label: 'Supplier Name',
    class: 'text-slate-500 text-xs'
  },
  {
    key: 'address',
    label: 'Address',
    class: 'text-slate-500 text-xs'
  },
  {
    key: 'contact_person',
    label: 'Contact Person',
    class: 'text-slate-500 text-xs'
  },
  {
    key: 'contact_no',
    label: 'Contact No',
    class: 'text-slate-500 text-xs'
  },
  {
    key: 'actions',
    label: 'Actions',
    class: 'text-slate-500 text-xs'
  }
]

const emit = defineEmits<{
  edit: [supplier: ISupplier]
}>()

function onEdit(supplier: ISupplier, index: number) {
  selected_index.value = index
  emit('edit', supplier)
}

const notification = useNotification()

async function onDelete(supplier: ISupplier, index: number, close: () => void) {
  selected_index.value = index
  await remove('suppliers', supplier?.id)
  notification.error({ title: 'Supplier removed successfully' })
  close()
}

const { isLoading: is_loading } = useHttp()
</script>
