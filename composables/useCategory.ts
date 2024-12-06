import type { ICategory, ICategoryFormRequest } from '~/types'
import { useDebounceFn } from '@vueuse/core'

export function useCategory() {
  const isAdd = useState('category_is_add', () => false)
  const selected = useState<ICategory | null>('category_selected', () => null)
  const list = useState<ICategory[]>('categories', () => [])
  const listCount = ref(0)
  const selectedIndex = useState('category_selected_index', () => 0)

  const http = useHttp()
  const log = useLog()

  async function fetchCategories({ search }: { search: string }) {
    const data = await http.get<ICategory>('/api/categories', { search })
    list.value = data
    await log.create('fetch_categories', `fetching categories`)
    return data
  }

  async function create(payload: ICategoryFormRequest) {
    const body = {
      user_id: useSupabaseUser().value?.id,
      ...payload
    }
    const data = await http.post<ICategory, ICategoryFormRequest>(
      '/api/categories',
      body
    )
    list.value.unshift(data)
    await log.create('create_category', 'created new category')
  }

  async function update(payload: ICategoryFormRequest) {
    const data = await http.update<ICategory, ICategoryFormRequest>(
      `/api/categories/${payload.id}`,
      payload
    )
    list.value[selectedIndex.value] = data
    await log.create('update_category', `updated category '${payload.id}'`)
  }

  async function remove(id: string): Promise<void> {
    await http.remove<ICategory>(`/api/categories/${id}`)
    list.value.splice(selectedIndex.value, 1)
    await log.create('delete_category', `removed category ${id}`)
  }

  function reset() {
    isAdd.value = false
    selected.value = null
    list.value = []
    listCount.value = 0
    selectedIndex.value = 0
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
    search,
    reset
  }
}
