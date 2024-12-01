import type {
  IOrderResponse,
  ITransaction,
  ITransactionFormRequest
} from '~/types'

export function useTransaction() {
  const barcode = ref('')
  const aboutToPay = useState('about_to_pay', () => false)
  const transaction = useState<ITransaction | null>('transaction', () => null)
  const tenderAmount = useState('transaction_amount', () => 0)
  const total = useState('transaction_total', () => 0)
  const change = useState('transaction_change', () => 0)
  const completed = useState('transaction_completed', () => false)

  const http = useHttp()
  const { items, item, qty } = useOrder()

  async function getOrCreateTransaction() {
    const data = await http.post<ITransaction, null>('/api/transactions', null)

    if (!data) return null

    transaction.value = data as ITransaction

    return data
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
      qty.value = 1
    }
  }

  async function createSales(): Promise<boolean> {
    const { transaction_no } = transaction.value as ITransaction
    const _amount = tenderAmount.value
    const _total = getTotal.value
    const _change = getChange.value

    const payload = {
      transaction_no,
      amount: _amount,
      total: _total,
      change: _change,
      orders: items.value
    }

    const data = await http.post<unknown, Record<string, string | number>>(
      '/api/transactions/create-sales',
      payload
    )
    return data as boolean
  }

  function reset() {
    barcode.value = ''
    items.value = []
    item.value = null
    qty.value = 0
    total.value = 0
    tenderAmount.value = 0
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
    change,
    completed,
    reset
  }
}
