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
  id: number
  name: string
  description: string
  supplier_price: number
  markup: number | string
  price: number
  price_formatted: string
  category_id: number | string
  qty: number
  barcode: string
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

export interface IProductFormRequest
  extends Partial<Record<keyof IProduct, string | number | undefined>> {
  barcode_img?: File | null
}

export interface ICategoryFormRequest
  extends Partial<Record<keyof ICategory, string | number | undefined>> {}

export interface IProductMapped extends IProduct {
  price_formatted: string
}

export interface IItemResponse<T> {
  items: T[]
  total: number
}

export interface ITransaction {
  id: number
  transaction_no: string
  status: TransactionStatus
  created_at: Date
}

export interface ITransactionFormRequest extends Partial<ITransaction> {}

export enum TransactionStatus {
  PENDING = 'pending',
  COMPLETED = 'completed',
  CANCELLED = 'cancelled'
}

export interface IOrder {
  created_at?: Date
  id: number
  price: number
  product_id: number
  qty: number
  subtotal: number
  transaction_no: string
}

export interface IOrderFormRequest extends Partial<IOrder> {}

export interface IOrderResponse extends Partial<Omit<IOrder, 'product_id'>> {
  product: IProduct
}

export type TrialPeriodDays = 30 | 45 | 60 | 75 | 90

export interface ISetting {
  trial_period_days: TrialPeriodDays
  trial_period_start: Date
  triald_period_end: Date
}

export interface ISettingFormRequest extends Partial<ISetting> {}
