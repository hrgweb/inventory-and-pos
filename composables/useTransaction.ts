import type { IProduct } from '~/types'
import { get, useStorage } from '@vueuse/core'
import { generateHash } from '~/utils'

const DATA_SERIALIZER = {
  serializer: {
    read: (v: any) => (v ? JSON.parse(v) : null),
    write: (v: any) => JSON.stringify(v)
  }
}

const barcode = ref('')
const product = useStorage<IProduct | null>(
  'product',
  null,
  undefined,
  DATA_SERIALIZER
)
const items = useStorage<IProduct[]>('items', [], undefined, DATA_SERIALIZER)
const aboutToPay = ref(false)
const tenderAmount = ref(0)

export function useTransaction() {
  const http = useHttp()

  async function getOrCreateTransaction() {
    const data = await http.post('/api/transactions', {
      transaction_no: generateHash(22)
    })
  }

  async function findProduct({ barcode }: { barcode: string }) {
    const query = {
      barcode
    }
    const data = await http.post<IProduct, { barcode: string }>(
      `/api/products/find-by-barcode`,
      query
    )
    // if (data) {
    //   product.value = data
    //   items.value.push(data)
    // }
  }

  async function createSales() {
    const payload = {
      items: items.value,
      tender_amount: tenderAmount.value
    }
    await http.post('/api/transactions/create-sales', payload)
  }

  const getTotal = computed<number>(() => {
    if (!items.value?.length) return 0

    return items.value.reduce((acc, item) => {
      const quantity = 1
      const price = item.price ?? 0
      return acc + price * quantity
    }, 0)
  })
  const getChange = computed<number>(() => {
    const change = tenderAmount.value - getTotal.value
    return change > 0 ? change : 0
  })

  return {
    barcode,
    findProduct,
    product,
    items,
    getTotal,
    aboutToPay,
    tenderAmount,
    getChange,
    createSales,
    getOrCreateTransaction
  }
}
