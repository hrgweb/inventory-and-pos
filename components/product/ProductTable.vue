<template>
  <UCard>
    <UTable :rows="items" :columns="columns">
      <template #name-data="{ row }">
        <span>{{ row.name }}</span>
      </template>
      <template #price-data="{ row }">
        <span>{{ row.price_formatted }}</span>
      </template>
      <template #subtotal-data="{ row }">
        <span>{{ row.subtotal_formatted }}</span>
      </template>
      <template #actions-data="{ row, index }">
        <div class="flex gap-3">
          <Icon
            class="cursor-pointer text-xl text-orange-500"
            name="heroicons:pencil"
            @click="onEdit(row, index)"
          />

          <UPopover>
            <Icon
              class="cursor-pointer text-xl text-red-500"
              name="heroicons:trash"
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

    <UPagination
      v-model="page"
      class="pt-3"
      :page-count="5"
      :total="list_count"
      @update:model-value="page = $event"
    />
  </UCard>
</template>

<script setup lang="ts">
import type { IProduct } from '~/types'

const {
  getProducts: items,
  page,
  listCount: list_count,
  selectedIndex,
  remove
} = useProduct()

const columns = [
  {
    key: 'name',
    label: 'Product'
  },
  {
    key: 'price',
    label: 'Price'
  },
  {
    key: 'qty',
    label: 'Qty'
  },
  {
    key: 'actions',
    label: 'Actions'
  }
]

const emit = defineEmits<{
  edit: [product: IProduct]
}>()

function onEdit(product: IProduct, index: number) {
  selectedIndex.value = index
  emit('edit', product)
}

const notification = useNotification()

async function onDelete(product: IProduct, index: number, close: () => void) {
  selectedIndex.value = index
  await remove(+product?.id)
  notification.error({ title: 'Product removed successfully' })
  close()
}
</script>
