import type { ICategory, ICategoryFormRequest } from '~/types'
import { useDebounceFn } from '@vueuse/core'

export function useCategory() {
  const isAdd = useState('category_is_add', () => false)
  const selected = ref<ICategory | null>(null)
  const list = useState<ICategory[]>('categories', () => [])
  const listCount = ref(0)
  const selectedIndex = ref(0)

  const http = useHttp()

  async function fetchCategories({ search }: { search: string }) {
    const data = await http.get<ICategory>('/api/categories', { search })
    list.value = data
    return data
  }

  async function create(payload: ICategoryFormRequest) {
    const data = await http.post<ICategory, ICategoryFormRequest>(
      '/api/categories',
      payload
    )
    list.value.unshift(data)
  }

  async function update(payload: ICategoryFormRequest) {
    const data = await http.update<ICategory, ICategoryFormRequest>(
      `/api/categories/${payload.id}`,
      payload
    )
    list.value[selectedIndex.value] = data
  }

  async function remove(id: number): Promise<void> {
    await http.remove<ICategory>(`/api/categories/${id}`)
    list.value.splice(selectedIndex.value, 1)
  }

  const search = useDebounceFn(async (q: string) => {
    list.value = []
    await fetchCategories({ search: q })
  }, 500)

  return {
    create,
    isAdd,
    selected,
    update,
    fetchCategories,
    list,
    listCount,
    selectedIndex,
    remove,
    search
  }
}
