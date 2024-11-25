import type {
  ICategory,
  ICategory,
  IProductFormRequest,
  IProductMapped,
  IProductResponse,
  ICategoryFormRequest
} from '~/types'
import { formatNumber, mapItem } from '~/utils'

const isAdd = ref(false)
const selected = ref<ICategory | null>(null)
const list = ref<ICategory[]>([])
const listCount = ref(0)
const page = ref(1)
const selectedIndex = ref(0)

export function useCategory() {
  const notification = useNotification()

  function addToCart() {
    notification.success({ title: 'Added to cart.' })
  }

  async function create(
    payload: IProductFormRequest
  ): Promise<ICategory | null> {
    try {
      const data = await $fetch<ICategory>('/api/categories', {
        method: 'POST',
        body: JSON.stringify(payload)
      })
      list.value.unshift(mapProduct(data))
    } catch (error) {
      console.log(error)
    }
    return null
  }

  async function update(
    payload: ICategoryFormRequest
  ): Promise<ICategory | null> {
    try {
      const data = await $fetch<ICategory>(`/api/categories/${payload.id}`, {
        method: 'PATCH',
        body: JSON.stringify(payload)
      })
      const content = mapProduct(data)
      list.value[selectedIndex.value] = content
    } catch (error) {
      console.log(error)
    }
    return null
  }

  async function fetchCategories(): Promise<ICategory[]> {
    try {
      const data = await $fetch<ICategory[]>('/api/categories')
      list.value = data
    } catch (error) {
      console.log(error)
    }
    return []
  }

  async function remove(id: number): Promise<void> {
    try {
      await $fetch<void>(`/api/categories/${id}`, {
        method: 'DELETE'
      })
      list.value.splice(selectedIndex.value, 1)
    } catch (error) {
      console.log(error)
    }
  }

  function mapProduct(item: ICategory): IProductMapped {
    let newObj = mapItem(item) as IProductMapped
    newObj['price_formatted'] = formatNumber(item.price)
    return newObj
  }

  const getCategories = computed<ICategory[]>(() => list.value)

  return {
    create,
    getCategories,
    isAdd,
    selected,
    update,
    fetchCategories,
    list,
    listCount,
    page,
    selectedIndex,
    remove
  }
}
