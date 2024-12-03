<template>
  <UCard>
    <UTable
      :loading="is_loading"
      v-model:expand="expand"
      :rows="items"
      :columns="columns"
      :ui="{ td: { padding: 'py-2' } }"
      @update:expand="handleExpand"
    >
      <template #transaction_no-data="{ row: item }">
        <span class="font-semibold text-slate-600">{{
          item.transactions.transaction_no
        }}</span>
      </template>
      <template #total-data="{ row: item }">
        <span>{{ formatNumber(item.total) }}</span>
      </template>
      <template #created_at-data="{ row: item }">
        <span>{{ format(item.transactions.created_at, 'PP') }}</span>
      </template>

      <!-- Expanded -->
      <template #expand="{ row: sub_item }">
        <div class="p-4">
          <div class="flex gap-3 items-center">
            <h3 class="text-sm font-medium">Purchased Products</h3>
            <UBadge color="blue" variant="solid">{{
              sub_item.orders.length
            }}</UBadge>
          </div>

          <UTable
            :rows="sub_item.orders"
            :columns="expandColumns"
            :ui="{ td: { padding: 'py-2' } }"
          >
            <template #product_name-data="{ row }">
              <span>{{ row.products.name }}</span>
            </template>
            <template #barcode-data="{ row }">
              <span>{{ row.products.barcode }}</span>
            </template>

            <template #selling_price-data="{ row }">
              <span>{{ formatNumber(row.products.selling_price) }}</span>
            </template>
            <template #subtotal-data="{ row }">
              <span>{{ formatNumber(row.subtotal) }}</span>
            </template>
          </UTable>
        </div>
      </template>
    </UTable>

    <UPagination
      v-model="page"
      class="pt-3"
      :page-count="15"
      :total="list_count"
      @update:model-value="page = $event"
    />
  </UCard>
</template>

<script setup lang="ts">
import { format } from 'date-fns'
import type { IOrderResponse, ISales } from '~/types'
import { formatNumber } from '~/utils'

const { list: items, page, listCount: list_count } = useSales()

const columns = [
  {
    key: 'transaction_no',
    label: 'Transaction No',
    class: 'text-slate-500 text-xs'
  },
  {
    key: 'total',
    label: 'Total',
    class: 'text-slate-500 text-xs'
  },
  {
    key: 'created_at',
    label: 'Date Created',
    class: 'text-slate-500 text-xs'
  }
]

const expandColumns = [
  {
    key: 'product_name',
    label: 'Product Name',
    class: 'text-slate-500 text-xs'
  },
  {
    key: 'barcode',
    label: 'Barcode',
    class: 'text-slate-500 text-xs'
  },
  {
    key: 'selling_price',
    label: 'Price',
    class: 'text-slate-500 text-xs'
  },
  {
    key: 'qty',
    label: 'Qty',
    class: 'text-slate-500 text-xs'
  },
  {
    key: 'subtotal',
    label: 'Subtotal',
    class: 'text-slate-500 text-xs'
  }
]

const expand = ref({
  openedRows: [],
  row: {}
})

function handleExpand({
  openedRows,
  row
}: {
  openedRows: ISales[]
  row: ISales
}) {
  // console.log('opened Rows:', openedRows)
  // console.log('Row Data:', row)
}

const { isLoading: is_loading } = useHttp()
</script>
