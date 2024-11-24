import type {
  IProduct,
  ICategory,
  IProductFormRequest,
  IProductResponse
} from '~/types'
import { formatNumber, mapItem } from '~/utils'

const isAdd = ref(false)
const selected = ref<IProduct | null>(null)

export function useProduct() {
  const categories = ref<ICategory[]>([])
  const list = ref<IProduct[] | IProductResponse[]>([])

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
      return data as IProduct
    } catch (error) {
      console.log(error)
    }
    return null
  }

  async function update(
    payload: IProductFormRequest
  ): Promise<IProduct | null> {
    try {
      const data = await $fetch<IProduct>(`/api/products/${payload.id}`, {
        method: 'PATCH',
        body: JSON.stringify(payload)
      })
      return data as IProduct
    } catch (error) {
      console.log(error)
    }
    return null
  }

  async function fetchCategories(): Promise<ICategory[]> {
    try {
      const data = await $fetch<ICategory[]>('/api/categories')
      categories.value = data
      return data
    } catch (error) {
      console.log(error)
    }
    return []
  }

  async function fetchProducts(): Promise<ICategory[]> {
    try {
      const data = await $fetch<IProduct[]>('/api/products')
      list.value = data.map((item) => mapProduct(item)) as IProductResponse[]
    } catch (error) {
      console.log(error)
    }
    return []
  }

  function mapProduct(item: IProduct): IProductResponse {
    let newObj = mapItem(item) as IProductResponse
    newObj['price_formatted'] = formatNumber(item.price)
    return newObj
  }

  const getCategories = computed(() => categories.value)
  const getProducts = computed(() => {
    if (!list.value || list.value.length === 0) {
      return []
    }
    return list.value.map((item) => {
      let newObj = mapItem(item) as IProductResponse
      newObj['price_formatted'] = formatNumber(item.price)
      return newObj
    })
  })

  onBeforeMount(async () => {
    fetchCategories()
    fetchProducts()
  })

  return {
    addToCart,
    create,
    getCategories,
    getProducts,
    isAdd,
    selected,
    update
  }
}
