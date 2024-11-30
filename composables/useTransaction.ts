import type {
  IOrderResponse,
  ITransaction,
  ITransactionFormRequest
} from '~/types'
import { useStorage } from '@vueuse/core'
import { DATA_SERIALIZER } from '~/utils'

export function useTransaction() {
  const barcode = ref('')
  const aboutToPay = useState('about_to_pay', () => false)
  const tenderAmount = ref(0)
  const transaction = useStorage<ITransaction>(
    'transaction',
    null,
    undefined,
    DATA_SERIALIZER
  )
  const total = ref(0)
  const change = useState('transaction_change', () => 0)

  const http = useHttp()
  const { items, item } = useOrder()

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

  async function createSales(): Promise<boolean> {
    const _transaction = transaction.value
    const _amount = tenderAmount.value

    const payload = {
      transaction_no: _transaction.transaction_no,
      tender_amount: _amount
    }

    const data = await http.post<unknown, Record<string, string | number>>(
      '/api/transactions/create-sales',
      payload
    )
    return data as boolean
  }

  async function remove(orderId: number): Promise<boolean> {
    await http.remove<IOrderResponse>(`/api/orders/${orderId}`)
    return true
  }

  async function fetchOrders() {
    const query = { transaction_no: transaction.value?.transaction_no }
    const data = await http.get<IOrderResponse>('/api/orders', query)
    items.value = data as IOrderResponse[]
  }

  const getTotal = computed<number>(() => {
    if (!items.value?.length) return 0

    const _total = items.value.reduce((acc, item) => {
      const quantity = 1
      const price = item.price ?? 0
      return acc + price * quantity
    }, 0)

    total.value = _total
    return _total
  })

  const getChange = computed<number>(() => {
    let _change = tenderAmount.value - getTotal.value
    _change = _change > 0 ? _change : 0

    change.value = _change
    return _change
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
    fetchOrders,
    remove,
    total,
    change
  }
}
