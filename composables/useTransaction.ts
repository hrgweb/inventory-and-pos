import type { IProduct } from '~/types'
import { useStorage } from '@vueuse/core'

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

export function useTransaction() {
  const http = useHttp()

  async function findProduct({ barcode }: { barcode: string }) {
    const query = {
      barcode
    }
    const data = await http.getOne<IProduct>(
      `/api/products/find-by-barcode`,
      query
    )
    if (data) {
      product.value = data
      items.value.push(data)
    }
  }

  const getTotal = computed<number>(() => {
    if (!items.value?.length) return 0

    return items.value.reduce((acc, item) => {
      const quantity = 1
      const price = item.price ?? 0
      return acc + price * quantity
    }, 0)
  })

  return { barcode, findProduct, product, items, getTotal, aboutToPay }
}
