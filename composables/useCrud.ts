import type { ICategory, ICategoryFormRequest } from '~/types'
import { useDebounceFn } from '@vueuse/core'

export function useCrud() {
  const isAdd = useState('item_is_add', () => false)
  const selected = useState<ICategory | null>('item_selected', () => null)
  const list = useState<any[]>('items', () => [])
  const listCount = ref(0)
  const selectedIndex = useState('item_selected_index', () => 0)

  const http = useHttp()
  const log = useLog()

  async function fetchItems<T>({
    table,
    search
  }: {
    table: string
    search: string
  }): Promise<T[]> {
    const data = await http.get<T>(`/api/${table}`, { search })
    list.value = data as T[]
    await log.create('fetch_items', `fetching items`)
    return data
  }

  async function create<T, B>(payload: B): Promise<void> {
    const body = {
      user_id: useSupabaseUser().value?.id,
      ...payload
    }
    const data = await http.post<T, B>('/api/items', body)
    list.value.unshift(data)
    await log.create('create_item', 'created new item')
  }

  async function update<T, B extends { id: string }>(
    payload: B
  ): Promise<void> {
    const data = await http.update<T, B>(`/api/items/${payload.id}`, payload)
    list.value[selectedIndex.value] = data
    await log.create('update_item', `updated item '${payload.id}'`)
  }

  async function remove<T>(id: string): Promise<void> {
    await http.remove<T>(`/api/items/${id}`)
    list.value.splice(selectedIndex.value, 1)
    await log.create('delete_item', `removed item ${id}`)
  }

  function reset() {
    isAdd.value = false
    selected.value = null
    list.value = []
    listCount.value = 0
    selectedIndex.value = 0
  }

  const search = useDebounceFn(
    async (table: string, q: string): Promise<void> => {
      list.value = []
      await fetchItems({ table, search: q })
    },
    500
  )

  return {
    create,
    isAdd,
    selected,
    update,
    fetchItems,
    list,
    listCount,
    selectedIndex,
    remove,
    search,
    reset
  }
}
