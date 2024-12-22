import type {
  IProduct,
  IProductFormRequest,
  IProductMapped,
  IItemResponse
} from '~/types'
import { formatNumber, mapItem } from '~/utils'
import { useDebounceFn } from '@vueuse/core'
import fuzzysort from 'fuzzysort'

export function useProduct() {
  const list = useState<IProduct[] | IProductMapped[]>('products', () => [])
  const isAdd = useState('product_is_add', () => false)
  const selected = useState<IProduct | null>('product_selected', () => null)
  const listCount = useState('product_count', () => 0)
  const page = useState('product_page', () => 1)
  const selectedIndex = useState('product_selected_index', () => 0)
  const searchResults = useState<any[]>('product_search_results', () => [])
  const searched = useState('product_searched', () => false)

  const http = useHttp()
  const notification = useNotification()
  const log = useLog()

  function addToCart() {
    notification.success({ title: 'Added to cart.' })
  }

  async function create(
    payload: IProductFormRequest
  ): Promise<IProduct | null> {
    const body = {
      user_id: useSupabaseUser().value?.id,
      ...payload
    }
    try {
      const data = await http.post<IProduct, IProductFormRequest>(
        '/api/products',
        body
      )
      list.value.unshift(mapProduct(data))

      await log.create('create_product', 'created new product')
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
    await log.create('update_product', `updated product '${payload.id}'`)
  }

  const search = useDebounceFn(async (q: string) => {
    // list.value = []
    page.value = 1
    // await fetchProducts({ search: q })
    // await log.create('search_on_products', `made a search on products`)

    searched.value = true

    if (!q) {
      console.log('no queries')
      searched.value = false
    }

    const data = list.value

    if (!data || data.length === 0) return

    // tmp
    const result = fuzzysort.go(q, data, {
      threshold: 0, // Don't return matches worse than this
      limit: 0, // Don't return more results than this
      all: false, // If true, returns all results for an empty search

      key: 'name' // For when targets are objects (see its example usage)
      // keys: null,      // For when targets are objects (see its example usage)
      // scoreFn: null,   // For use with `keys` (see its example usage)
    })

    searchResults.value = result.map((item) => item.obj as IProduct)
  }, 500)

  async function fetchProducts({ search }: { search: string }) {
    list.value = []

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
    await log.create('fetch_products', `fetching products`)
  }

  async function remove(id: string): Promise<void> {
    await http.remove<IProduct>(`/api/products/${id}`)
    list.value.splice(selectedIndex.value, 1)
    await log.create('delete_product', `removed product ${id}`)
  }

  function mapProduct(item: IProduct): IProductMapped {
    let newObj = mapItem(item) as IProductMapped
    newObj['cost_price_formatted'] = item.cost_price
      ? formatNumber(item.cost_price)
      : '0'
    newObj['selling_price_formatted'] = item.selling_price
      ? formatNumber(item.selling_price)
      : '0'
    newObj['reorder_level'] = item.reorder_level || 0
    newObj['uom_number'] = item.uom_number || 0
    return newObj
  }

  function reset() {
    list.value = []
    isAdd.value = false
    selected.value = null
    listCount.value = 0
    page.value = 1
    selectedIndex.value = 0
  }

  const getProducts = computed<IProductMapped[]>(() => {
    if (!list.value || list.value.length === 0) {
      return []
    }

    if (searched.value) {
      return searchResults.value.map((item) => mapProduct(item))
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
    search,
    reset,
    searched
  }
}
