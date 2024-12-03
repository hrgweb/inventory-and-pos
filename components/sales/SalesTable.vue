<template>
  <UCard>
    <UTable :rows="items" :columns="columns" :ui="{ td: { padding: 'py-2' } }">
      <template #transaction_no-data="{ row }">
        <span>{{ row.transactions.transaction_no }}</span>
      </template>
      <template #name-data="{ row }">
        <span>{{ row.name }}</span>
      </template>
      <template #barcode-data="{ row }">
        <span>{{ row.barcode }}</span>
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
            +row.stock_qty <= +row.reorder_level
              ? 'bg-red-500 text-white p-1 rounded'
              : ''
          ]"
          >{{ row.reorder_level }}</span
        >
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
const { list: items, page, listCount: list_count } = useSales()

const columns = [
  {
    key: 'transaction_no',
    label: 'Transaction No',
    class: 'text-slate-500 text-xs'
  },
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
    key: 'product_name',
    label: 'Product Name',
    class: 'text-slate-500 text-xs'
  },
  {
    key: 'product_name',
    label: 'Product Name',
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
    key: 'reorder_level',
    label: 'Reorder Level',
    class: 'text-slate-500 text-xs'
  },
  {
    key: 'stock_qty',
    label: 'Stock Qty',
    class: 'text-slate-500 text-xs'
  },
  {
    key: 'actions',
    label: 'Actions',
    class: 'text-slate-500 text-xs'
  }
]
</script>
