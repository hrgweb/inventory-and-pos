export interface INavigationOptions {
  name: string
  label: string
  icon: string
  to: string
}

export type ProductHeaderTitle = 'New Product' | 'Update Product'

export interface IProduct {
  id: number
  product_name: string
  description: string
  supplier_price: number
  mark_up: number | string
  price: number
  thumbnail?: string
  image: File | null
}

export type ProductSortBy = 'Latest Added' | 'Product Name'

export interface IProductCategory {
  id: number
  name: string
  description?: string
}

export type ProductCategoryHeaderTitle = 'New Category' | 'Update Category'
