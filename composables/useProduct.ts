import type {
  IProduct,
  IProductFormRequest,
  IProductMapped,
  IItemResponse
} from '~/types'
import { formatNumber, mapItem } from '~/utils'
import { useDebounceFn } from '@vueuse/core'

export function useProduct() {
  const list = useState<IProduct[] | IProductMapped[]>('products', () => [])
  const isAdd = useState('product_is_add', () => false)
  const selected = useState<IProduct | null>('product_selected', () => null)
  const listCount = useState('product_count', () => 0)
  const page = useState('product_page', () => 1)
  const selectedIndex = useState('product_selected_index', () => 0)

  const http = useHttp()
  const notification = useNotification()

  function addToCart() {
    notification.success({ title: 'Added to cart.' })
  }

  async function create(
    payload: IProductFormRequest
  ): Promise<IProduct | null> {
    try {
      const data = await $fetch<IProduct>('/api/products', {
        method: 'POST',
        body: JSON.stringify(payload)
      })
      list.value.unshift(mapProduct(data))
    } catch (error) {
      console.log(error)
    }
    return null
  }

  async function update(payload: IProductFormRequest) {
    const data = await http.update<IProduct, IProductFormRequest>(
      `/api/products/${payload.id}`,
      payload
    )
    const content = mapProduct(data)
    list.value[selectedIndex.value] = content
  }

  const search = useDebounceFn(async (q: string) => {
    list.value = []
    page.value = 1
    await fetchProducts({ search: q })
  }, 500)

  async function fetchProducts({ search }: { search: string }) {
    const _page = page.value

    if (!_page) return null

    const query = {
      page: toValue(_page),
      search
    }
    const data = await http.getCustom<IItemResponse<IProduct>>(
      '/api/products',
      query
    )

    if (!data.items || data.items.length === 0) return []

    list.value = data.items.map((item) => mapProduct(item)) as IProductMapped[]
    listCount.value = data.total
  }

  async function remove(id: number): Promise<void> {
    await http.remove<IProduct>(`/api/products/${id}`)
    list.value.splice(selectedIndex.value, 1)
  }

  function mapProduct(item: IProduct): IProductMapped {
    let newObj = mapItem(item) as IProductMapped
    newObj['selling_price_formatted'] = formatNumber(item.selling_price)
    return newObj
  }

  const getProducts = computed<IProductMapped[]>(() => {
    if (!list.value || list.value.length === 0) {
      return []
    }
    return list.value.map((item) => mapProduct(item))
  })

  return {
    addToCart,
    create,
    getProducts,
    isAdd,
    selected,
    update,
    fetchProducts,
    list,
    listCount,
    page,
    selectedIndex,
    remove,
    search
  }
}
