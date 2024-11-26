import type { IProduct } from '~/types'

export function useOrder() {
  const http = useHttp()
  const { create: createOrderItems } = useOrderItem()

  async function create(items: IProduct[]) {
    // Save to order items
    await createOrderItems(items)

    // Save to orders
  }

  return { create }
}
