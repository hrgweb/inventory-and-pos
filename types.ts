export interface INavigationOptions {
  name: string
  label: string
  icon: string
  to: string
}

export interface ISocialLink {
  name: string
  url: string
}

export interface IProduct {
  id: string
  name: string
  description: string
  supplier_price: number
  mark_up: number | string
  price: number
  price_formatted: string
  thumbnail?: string
  image?: File | null
  category_id: number
  qty: number
}

export type ProductSortBy = 'Latest Added' | 'Product Name'

export interface ICategory {
  id: string
  name: string
  description?: string
}

export type BarcodeOptions = 'webcam' | 'scanner' | 'choose' | 'none'

export interface IPayment {
  id: number
  bank_name: string
  account_name: string
  account_number: string
  account_details: string
}

export interface IItem extends Partial<IProduct> {
  qty: number
  subtotal: number
  subtotal_formatted: string
}

export interface IProductFormRequest extends Partial<IProduct> {}
