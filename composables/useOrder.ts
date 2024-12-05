import type { IOrderResponse, IProduct, IProductFormRequest } from '~/types'

export function useOrder() {
  const items = useState<IOrderResponse[]>('order_items', () => [])
  const item = useState<IOrderResponse | null>('order_item', () => null)
  const qty = useState('order_qty', () => 0)
  const selectedIndex = useState('order_selected_index', () => 0)

  const http = useHttp()

  async function create({
    user_id,
    transaction_no,
    product
  }: {
    user_id: string
    transaction_no: string
    product: IProduct
  }) {
    const payload = { user_id, transaction_no, product }
    const data = await http.post<IOrderResponse, IProductFormRequest>(
      '/api/orders',
      payload
    )
    if (data) {
      item.value = data
      items.value.push(data)
      qty.value = 1
    }
    return data
  }

  return { selectedIndex, items, item, qty, create }
}
