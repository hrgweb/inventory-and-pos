import type { ICategory, ICategoryFormRequest } from '~/types'

export function useCategory() {
  const isAdd = ref(false)
  const selected = ref<ICategory | null>(null)
  const list = useState<ICategory[]>('categories', () => [])
  const listCount = ref(0)
  const selectedIndex = ref(0)

  const http = useHttp()

  async function fetchCategories({ search }: { search: string }) {
    const data = await http.get<ICategory>('/api/categories', { search })
    list.value = data
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
    selectedIndex,
    remove
  }
}
