import type {
  IProduct,
  ICategory,
  IProductFormRequest,
  IProductMapped,
  IProductResponse
} from '~/types'
import { formatNumber, mapItem } from '~/utils'

const isAdd = ref(false)
const selected = ref<IProduct | null>(null)
const list = ref<IProduct[] | IProductMapped[]>([])

export function useProduct() {
  const categories = ref<ICategory[]>([])

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

  async function fetchProducts(): Promise<IProductResponse | null> {
    try {
      const data = await $fetch<IProductResponse>('/api/products')
      list.value = data.items.map((item) =>
        mapProduct(item)
      ) as IProductMapped[]
    } catch (error) {
      console.log(error)
    }
    return null
  }

  function mapProduct(item: IProduct): IProductMapped {
    let newObj = mapItem(item) as IProductMapped
    newObj['price_formatted'] = formatNumber(item.price)
    return newObj
  }

  const getCategories = computed(() => categories.value)
  const getProducts = computed<IProductMapped[]>(() => {
    if (!list.value || list.value.length === 0) {
      return []
    }
    return list.value.map((item) => mapProduct(item)) as IProductMapped[]
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
    fetchProducts
  }
}
