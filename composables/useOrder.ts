import type { IOrderResponse } from '~/types'
import { useStorage } from '@vueuse/core'
import { DATA_SERIALIZER } from '~/utils'

const items = useStorage<IOrderResponse[]>(
  'items',
  [],
  undefined,
  DATA_SERIALIZER
)
const item = useStorage<IOrderResponse | null>(
  'product',
  null,
  undefined,
  DATA_SERIALIZER
)

const selectedIndex = ref(0)

export function useOrder() {
  return { selectedIndex, items, item }
}
