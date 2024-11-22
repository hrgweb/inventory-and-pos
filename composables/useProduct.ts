import type { ICategory, IProductFormRequest } from '~/types'

export function useProduct() {
  const categories = ref<ICategory[]>([])

  const notification = useNotification()

  function addToCart() {
    notification.success({ title: 'Added to cart.' })
  }

  async function create(payload: IProductFormRequest) {
    console.log('payload: ', payload)

    const res = await $fetch('/api/products', {
      method: 'POST',
      body: JSON.stringify(payload)
    })

    console.log(res)
  }

  async function fetchCategories(): Promise<ICategory[]> {
    try {
      const data = await $fetch<ICategory[]>('/api/categories')
      categories.value = data
      return data
    } catch (error) {
      throw createError({
        statusCode: 500,
        statusMessage: (error as Error).message
      })
    }
  }

  const getCategories = computed(() => categories.value)

  onBeforeMount(async () => {
    fetchCategories()
  })

  return { addToCart, create, getCategories }
}
