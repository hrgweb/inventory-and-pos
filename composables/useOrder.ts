import type { IOrderResponse } from '~/types'

export function useOrder() {
  const items = useState<IOrderResponse[]>('order_items', () => [])
  const item = useState<IOrderResponse | null>('order_item', () => null)
  const qty = useState('order_qty', () => 0)

  const selectedIndex = ref(0)

  return { selectedIndex, items, item, qty }
}
