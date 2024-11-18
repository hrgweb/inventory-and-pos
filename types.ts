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

export interface ICategory {
  id: number
  name: string
  description?: string
}

export type CategoryHeaderTitle = 'New Category' | 'Update Category'

export type BarcodeOptions = 'webcam' | 'scanner' | 'choose' | 'none'

export type PaymentHeaderTitle = 'New Payment' | 'Update Payment'

export interface IPayment {
  id: number
  bank_name: string
  account_name: string
  account_number: string
  account_details: string
}
