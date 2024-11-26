import type { IProduct } from '~/types'

export function useOrderItem() {
  const http = useHttp()

  async function create(items: IProduct[]) {
    const item = await http.post('/api/order-items', items)
    console.log('item: ', item)
  }

  return { create }
}
