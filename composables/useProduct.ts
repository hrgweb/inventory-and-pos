import type {
  IProduct,
  ICategory,
  IProductFormRequest,
  IProductMapped,
  IItemResponse
} from '~/types'
import { formatNumber, mapItem } from '~/utils'

export function useProduct() {
  const list = useState<IProduct[] | IProductMapped[]>('products', () => [])
  const isAdd = useState('product_is_add', () => false)
  const selected = useState<IProduct | null>('product_selected', () => null)
  const categories = useState<ICategory[]>('product_categories', () => [])
  const listCount = ref(0)
  const page = ref(1)
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

  async function fetchCategories() {
    const data = await http.get<ICategory>('/api/categories')
    categories.value = data
  }

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
    newObj['price_formatted'] = formatNumber(item.price)
    return newObj
  }

  const getCategories = computed<ICategory[]>(() => categories.value)
  const getProducts = computed<IProductMapped[]>(() => {
    if (!list.value || list.value.length === 0) {
      return []
    }
    return list.value.map((item) => mapProduct(item))
  })

  return {
    addToCart,
    create,
    getCategories,
    getProducts,
    isAdd,
    selected,
    update,
    fetchCategories,
    fetchProducts,
    list,
    listCount,
    page,
    selectedIndex,
    remove
  }
}
