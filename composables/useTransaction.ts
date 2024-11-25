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

  return { barcode, findProduct, product, items }
}
