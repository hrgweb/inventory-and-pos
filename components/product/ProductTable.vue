<template>
  <UCard>
    <UTable :rows="items" :columns="columns">
      <template #name-data="{ row }">
        <span>{{ row.name }}</span>
      </template>
      <template #cost_price-data="{ row }">
        <span>{{ row.cost_price_formatted }}</span>
      </template>
      <template #selling_price-data="{ row }">
        <span>{{ row.selling_price_formatted }}</span>
      </template>
      <template #subtotal-data="{ row }">
        <span>{{ row.subtotal_formatted }}</span>
      </template>
      <template #reorder_level-data="{ row }">
        <span
          class="block"
          :class="[
            +row.stock_qty <= row.reorder_level
              ? 'bg-red-500 text-white p-1 rounded'
              : ''
          ]"
          >{{ row.reorder_level }}</span
        >
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
    key: 'cost_price',
    label: 'Cost Price'
  },
  {
    key: 'selling_price',
    label: 'Selling Price'
  },
  {
    key: 'reorder_level',
    label: 'Reorder Level'
  },
  {
    key: 'stock_qty',
    label: 'Stock Qty'
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
