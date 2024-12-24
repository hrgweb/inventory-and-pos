<template>
  <UCard>
    <UTable
      :loading="is_loading"
      :rows="items"
      :columns="columns"
      :ui="{ td: { padding: 'py-2' } }"
    >
      <template #supplier_name-data="{ row }">
        <span>{{ row.suppliers?.name }}</span>
      </template>
      <template #uom_number-data="{ row }">
        <span v-if="row.uom_number">{{ `${row.uom_number} ${row.uom}` }}</span>
        <span v-else>&nbsp;</span>
      </template>
      <template #barcode-data="{ row }">
        <span>{{ row.barcode }}</span>
      </template>
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

    <UPagination
      v-model="page"
      class="pt-3"
      :page-count="50"
      :total="list_count"
      @update:model-value="onPaginate"
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
  remove,
  fetchProducts,
  searched
} = useProduct()

const columns = [
  {
    key: 'supplier_name',
    label: 'Supplier',
    class: 'text-slate-500 text-xs'
  },
  {
    key: 'name',
    label: 'Product Name',
    class: 'text-slate-500 text-xs'
  },
  {
    key: 'uom_number',
    label: 'U/m',
    class: 'text-slate-500 text-xs'
  },
  {
    key: 'barcode',
    label: 'Barcode',
    class: 'text-slate-500 text-xs'
  },
  {
    key: 'cost_price',
    label: 'Cost Price',
    class: 'text-slate-500 text-xs'
  },
  {
    key: 'selling_price',
    label: 'Selling Price',
    class: 'text-slate-500 text-xs'
  },
  {
    key: 'actions',
    label: 'Actions',
    class: 'text-slate-500 text-xs text-center'
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
  await remove(product?.id)
  notification.error({ title: 'Product removed successfully' })
  close()
}

const { isLoading: is_loading } = useHttp()

async function onPaginate(_page: number) {
  page.value = _page
  await fetchProducts({ search: '' })
}
</script>
