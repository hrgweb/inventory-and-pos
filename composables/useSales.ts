import type { ISales, IItemResponse } from '~/types'
import { mapItem } from '~/utils'

export function useSales() {
  const list = useState<ISales[]>('sales', () => [])
  const listCount = ref(0)
  const page = useState('sales_page', () => 1)

  const http = useHttp()

  async function fetchSales() {
    const _page = page.value

    if (!_page) return null

    const query = {
      page: toValue(_page)
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

  return { fetchSales, list, listCount, page }
}
