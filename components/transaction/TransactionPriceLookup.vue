<!-- Product Price Lookup -->

<template>
  <UCard>
    <template #header>
      <div class="flex justify-between items-center">
        <AppPageTitle title="Product Lookup" />

        <UButton
          icon="heroicons:x-mark"
          class="rounded-full"
          variant="soft"
          color="white"
          size="xl"
          @click="$emit('close')"
        />
      </div>
    </template>

    <UForm :schema="schema" :state="state" class="space-y-4 mb-4">
      <UFormGroup label="" name="q">
        <UInput
          v-model="state.q"
          ref="lookup_input"
          class="w-full"
          size="xl"
          icon="heroicons:magnifying-glass"
          placeholder="Enter product barcode or name"
          :required="true"
          :autofocus="true"
          @input="onPriceLookup"
        />
      </UFormGroup>
    </UForm>

    <UTable
      :rows="products"
      :columns="columns"
      :ui="{ td: { padding: 'py-2' } }"
    >
      <template #name-data="{ row }">
        <span>{{ row.name }}</span>
      </template>
      <template #selling_price-data="{ row }">
        <span>{{ formatNumber(row.selling_price) }}</span>
      </template>
      <template #actions-data="{ row }">
        <UButton
          icon="lucide:plus"
          size="xs"
          color="blue"
          @click="onCreateOrder(row)"
        />
      </template>
    </UTable>
  </UCard>
</template>

<script setup lang="ts">
import { useFocus, useMagicKeys } from '@vueuse/core'
import type { IProduct, ITransaction } from '~/types'
import { formatNumber } from '~/utils'
import { z } from 'zod'

const lookup_input = ref()
const { focused } = useFocus(lookup_input, { initialValue: true })
const { escape } = useMagicKeys()

const schema = z.object({
  q: z.string().min(3, 'Must be at least 3 characters')
})

const state = reactive({
  q: ''
})

const columns = [
  // {
  //   key: 'barcode',
  //   label: 'Barcode'
  // },
  {
    key: 'name',
    label: 'Product Name'
  },
  {
    key: 'selling_price',
    label: ' Price'
  },
  {
    key: 'actions',
    label: '',
    class: 'w-[30px]'
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

const products = ref<IProduct[]>([])

const notification = useNotification()
const onPriceLookup = useDebounceFn(async () => {
  products.value = []

  const _search = state.q

  // Check if input is empty
  if (!_search) return

  // Check if input characters are less than 3 then return
  if (_search.length < 3) return

  const body = {
    search: _search,
    transaction_no: transaction.value?.transaction_no
  }

  try {
    const data = await http.get<IProduct>(`/api/pos/price-lookup`, body)
    products.value = data
  } catch (error: any) {
    const _error = error && error.data
    if (_error.statusCode === 404) {
      notification.error({ title: _error.message })
    }
  }
}, 1000)

const { create: orderCreate } = useOrder()

async function onCreateOrder(product: IProduct) {
  const _transaction = transaction.value as ITransaction
  const payload = {
    user_id: _transaction.user_id!,
    transaction_no: _transaction.transaction_no,
    product
  }
  await orderCreate(payload)
  emit('close')
}
</script>
