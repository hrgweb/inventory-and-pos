import type { ISales, IItemResponse } from '~/types'
import { mapItem } from '~/utils'

export function useSales() {
  const list = useState<ISales[]>('sales', () => [])
  const listCount = ref(0)
  const page = useState('sales_page', () => 1)
  const selectedDate = useState<Date | undefined>('sales_date', () => undefined)

  const http = useHttp()

  async function fetchSales({
    day,
    range
  }: {
    day?: Date | undefined
    range?: { start: Date; end: Date }
  }) {
    reset()

    const _page = page.value

    if (!_page) return null

    let query = {
      user_id: useSupabaseUser()?.value?.id,
      page: toValue(_page)
    } as Record<string, any>

    // Filter a day
    if (day) {
      query.day = day.toISOString()
    }

    // Filter a week or month or yearly
    if (range) {
      query.range = {
        start: range.start.toISOString(),
        end: range.end.toISOString()
      }
    }

    const data = await http.getCustom<IItemResponse<ISales>>(
      '/api/sales',
      query
    )

    if (!data.items || data.items.length === 0) return []

    list.value = data.items.map((item) => mapSale(item)) as ISales[]
    listCount.value = data.total
  }

  function mapSale(item: ISales): ISales {
    let newObj = mapItem(item) as ISales
    return newObj
  }

  function reset() {
    list.value = []
    listCount.value = 0
    page.value = 1
  }

  return { fetchSales, list, listCount, page, reset, selectedDate }
}
