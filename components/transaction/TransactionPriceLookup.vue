<template>
  <UCard>
    <UInput
      v-model="product_barcode"
      ref="lookup_input"
      class="w-full mb-6"
      size="xl"
      icon="heroicons:magnifying-glass"
      placeholder="Scan product barcode"
      @input="priceLookup"
    />

    <UTable :rows="products" :columns="columns">
      <template #name-data="{ row }">
        <span>{{ row.name }}</span>
      </template>
      <template #selling_price-data="{ row }">
        <span>{{ formatNumber(row.selling_price) }}</span>
      </template>
    </UTable>
  </UCard>
</template>

<script setup lang="ts">
import { useFocus, useMagicKeys } from '@vueuse/core'
import type { IProduct } from '~/types'
import { formatNumber } from '~/utils'

const lookup_input = ref()
const { focused } = useFocus(lookup_input, { initialValue: true })
const { escape } = useMagicKeys()

const columns = [
  {
    key: 'barcode',
    label: 'Barcode'
  },
  {
    key: 'name',
    label: 'Product Name'
  },
  {
    key: 'selling_price',
    label: ' Price'
  }
]

const emit = defineEmits<{
  close: [void]
}>()

watchEffect(() => {
  if (escape.value) {
    emit('close')
  }
})

onMounted(() => {
  focused.value = true
})

const { transaction } = useTransaction()
const http = useHttp()

const product_barcode = ref('')
const products = ref<IProduct[]>([])

const priceLookup = useDebounceFn(async () => {
  products.value = []

  // Check if input characters are less than 10 then return
  if (product_barcode.value.length < 10) return

  const body = {
    barcode: product_barcode.value,
    transaction_no: transaction.value?.transaction_no
  }
  const data = await http.getOne<IProduct>(`/api/pos/price-lookup`, body)
  if (data) {
    products.value.push(data)
    product_barcode.value = ''
  }
}, 200)
</script>
