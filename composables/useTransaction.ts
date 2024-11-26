import type {
  IOrderResponse,
  ITransaction,
  ITransactionFormRequest
} from '~/types'
import { useStorage } from '@vueuse/core'

const DATA_SERIALIZER = {
  serializer: {
    read: (v: any) => (v ? JSON.parse(v) : null),
    write: (v: any) => JSON.stringify(v)
  }
}

const barcode = ref('')
const item = useStorage<IOrderResponse | null>(
  'product',
  null,
  undefined,
  DATA_SERIALIZER
)
const items = useStorage<IOrderResponse[]>(
  'items',
  [],
  undefined,
  DATA_SERIALIZER
)
const aboutToPay = ref(false)
const tenderAmount = ref(0)
const transaction = useStorage<ITransaction>(
  'transaction',
  null,
  undefined,
  DATA_SERIALIZER
)

export function useTransaction() {
  const http = useHttp()

  async function getOrCreateTransaction() {
    const data = await http.post<ITransaction, null>('/api/transactions', null)

    if (!data) return null

    transaction.value = data as ITransaction
  }

  async function findProduct({ barcode }: { barcode: string }) {
    const body = {
      barcode,
      transaction_no: transaction.value?.transaction_no
    }

    const data = await http.post<IOrderResponse, ITransactionFormRequest>(
      `/api/products/find-by-barcode`,
      body
    )

    if (data) {
      item.value = data
      items.value.push(data)
    }
  }

  async function createSales() {
    const payload = {
      items: items.value,
      tender_amount: tenderAmount.value
    }

    await http.post('/api/transactions/create-sales', payload)
  }

  async function fetchOrders() {
    const query = { transaction_no: transaction.value?.transaction_no }
    const data = await http.get<IOrderResponse>('/api/orders', query)
    items.value = data as IOrderResponse[]
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
    items,
    getTotal,
    aboutToPay,
    tenderAmount,
    getChange,
    createSales,
    getOrCreateTransaction,
    transaction,
    fetchOrders
  }
}
