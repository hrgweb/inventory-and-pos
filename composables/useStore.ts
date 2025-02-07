import type { IProduct } from '~/types'
import { mapItem, formatNumber } from '~/utils'
import { useStorage } from '@vueuse/core'

export function useStore() {
  const IMAGE = 'https://loremflickr.com/1280/720'

  const products = ref<IProduct[]>([
    {
      id: 1,
      product_name: 'Shampoo',
      description: 'shampoo',
      supplier_price: 5,
      mark_up: '%',
      price: 10,
      price_formatted: formatNumber(10),
      thumbnail: IMAGE,
      image: null,
      social_links: [
        {
          name: 'Facebook',
          url: 'https://www.facebook.com'
        }
      ],
      copy_link: 'https://www.google.com'
    },
    {
      id: 2,
      product_name: 'Foods',
      description: 'foods',
      supplier_price: 15,
      mark_up: '%',
      price: 15,
      price_formatted: formatNumber(15),
      thumbnail: IMAGE,
      image: null,
      social_links: [
        {
          name: 'Facebook',
          url: 'https://www.facebook.com'
        }
      ],
      copy_link: 'https://www.google.com'
    },
    {
      id: 3,
      product_name: 'Tanduay',
      description: 'tanduay',
      supplier_price: 80,
      mark_up: '%',
      price: 80,
      price_formatted: formatNumber(80),
      thumbnail: IMAGE,
      image: null,
      social_links: [
        {
          name: 'Facebook',
          url: 'https://www.facebook.com'
        }
      ],
      copy_link: 'https://www.google.com'
    },
    {
      id: 21,
      product_name: 'Hamburger',
      description: 'hamburger',
      supplier_price: 45,
      mark_up: '%',
      price: 45,
      price_formatted: formatNumber(45),
      thumbnail: IMAGE,
      image: null,
      social_links: [
        {
          name: 'Facebook',
          url: 'https://www.facebook.com'
        }
      ],
      copy_link: 'https://www.google.com'
    },
    {
      id: 22,
      product_name: 'Goods',
      description: 'goods',
      supplier_price: 30,
      mark_up: '%',
      price: 30,
      price_formatted: formatNumber(30),
      thumbnail: IMAGE,
      image: null,
      social_links: [
        {
          name: 'Facebook',
          url: 'https://www.facebook.com'
        }
      ],
      copy_link: 'https://www.google.com'
    }
  ])

  const route = useRoute()

  const name = computed<string>(() => route.params.store as string)

  const getProducts = computed<IProduct[]>(() => {
    return products.value.map((product) => {
      let item = mapItem<IProduct>(product)
      item['price_formatted'] = formatNumber(item.price)
      return item
    })
  })

  function goToItem(item: IProduct): string {
    return `/${name.value}/products/${item.id}`
  }

  return { name, getProducts, goToItem }
}
