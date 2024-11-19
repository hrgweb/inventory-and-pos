import type { IItem, IProduct } from '~/types'
import { formatNumber } from '~/utils'

export function useCart() {
  const orders = ref<IProduct[]>([])
  const items = ref<IItem[]>([])

  onBeforeMount(async () => {
    await fetchOrders()
  })

  async function fetchOrders(): Promise<void> {
    // TODO: Fetch orders from API
    const { getProducts } = useStore()
    orders.value.push(getProducts.value[0])
    orders.value.push(getProducts.value[1])

    // No orders
    if (!orders.value || orders.value.length === 0) {
      return
    }

    // Map orders to items
    items.value = orders.value.map((order) => {
      const qty = 1

      return {
        product_id: order.id,
        product_name: order.product_name,
        thumbnail: order.thumbnail,
        price: order.price,
        price_formatted: formatNumber(order.price),
        qty,
        subtotal: order.price * qty
      }
    })
  }

  const getItems = computed<IItem[]>(() => items.value || [])

  return { getItems }
}
