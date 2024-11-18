import type { IProduct } from '~/types'
import { mapItem, formatNumber } from '~/utils'

export function useStore() {
  const IMAGE = 'https://loremflickr.com/1280/720'

  const products = ref<IProduct[]>([
    {
      id: 1,
      product_name: 'Shampoo',
      description: 'This is a shampoo',
      supplier_price: 12,
      mark_up: '%',
      price: 75,
      thumbnail: IMAGE,
      image: null
    },
    {
      id: 2,
      product_name: 'Foods',
      description: 'This is a shampoo',
      supplier_price: 12,
      mark_up: '%',
      price: 75,
      thumbnail: IMAGE,
      image: null
    },
    {
      id: 3,
      product_name: 'Tanduay',
      description: 'This is a shampoo',
      supplier_price: 12,
      mark_up: '%',
      price: 75,
      thumbnail: IMAGE,
      image: null
    },
    {
      id: 21,
      product_name: 'Shampoo',
      description: 'This is a shampoo',
      supplier_price: 12,
      mark_up: '%',
      price: 75,
      thumbnail: IMAGE,
      image: null
    },
    {
      id: 22,
      product_name: 'Foods',
      description: 'This is a shampoo',
      supplier_price: 12,
      mark_up: '%',
      price: 75,
      thumbnail: IMAGE,
      image: null
    },
    {
      id: 23,
      product_name: 'Tanduay',
      description: 'This is a shampoo',
      supplier_price: 12,
      mark_up: '%',
      price: 75,
      thumbnail: IMAGE,
      image: null
    },
    {
      id: 31,
      product_name: 'Shampoo',
      description: 'This is a shampoo',
      supplier_price: 12,
      mark_up: '%',
      price: 75,
      thumbnail: IMAGE,
      image: null
    },
    {
      id: 32,
      product_name: 'Foods',
      description: 'This is a shampoo',
      supplier_price: 12,
      mark_up: '%',
      price: 75,
      thumbnail: IMAGE,
      image: null
    },
    {
      id: 33,
      product_name: 'Tanduay',
      description: 'This is a shampoo',
      supplier_price: 12,
      mark_up: '%',
      price: 75,
      thumbnail: IMAGE,
      image: null
    }
  ])

  const name = computed<string>(() => route.params.store as string)

  const route = useRoute()

  const getProducts = computed<IProduct[]>(() => {
    return products.value.map((product) => {
      let item = mapItem<IProduct>(product)
      item['price_formatted'] = formatNumber(item.price)
      return item
    })
  })

  return { name, getProducts }
}
