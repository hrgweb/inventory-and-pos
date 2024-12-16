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
  cost_price: number
  selling_price: number
  category_id: string
  barcode: string
  stock_qty: number
  reorder_level: number
  uom: string
  uom_number: number
  weight: number
  volume: number
  length: number
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
  cost_price_formatted: string
  selling_price_formatted: string
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
  user_id: string
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
  product_id_count?: number
}

export type TrialPeriodDays = 30 | 45 | 60 | 75 | 90

export interface ISetting {
  id?: number
  trial_period_days: TrialPeriodDays
  trial_period_start: Date | null
  trial_period_end: Date | null
}

export interface ISettingFormRequest extends Partial<ISetting> {}

export interface ISettingResponse extends Partial<ISetting> {}

export interface IDaysRemaining {
  days: number
  hours: number
  minutes: number
  seconds: number
}

export type ModalValue = 'none' | 'form' | 'completed' | 'lookup'

export interface ISales {
  transaction: ITransaction
  orders: IOrderResponse[]
  amount: number
  total: number
  change: number
}

export enum InventoryType {
  REORDER_PRODUCT = 'reorder_product',
  RETURNED_PRODUCT = 'returned_product',
  EXPIRED_PRODUCT = 'expired_product',
  DAMAGED_PRODUCT = 'damaged_product'
}

export type LogAction =
  // Admin
  | 'signed_in'
  | 'signed_out'
  | 'create_product'
  | 'update_product'
  | 'delete_product'
  | 'search_on_products'
  | 'fetch_products'
  | 'create_category'
  | 'update_category'
  | 'delete_category'
  | 'search_on_categories'
  | 'fetch_categories'
  | 'fetch_sales'
  | 'create_sales'
  | 'filter_sales_by_date'
  | 'filter_sales_by_daily'
  | 'filter_sales_by_weekly'
  | 'filter_sales_by_monthly'
  | 'filter_sales_by_yearly'
  // Pos
  | 'pos_fetch_orders'
  | 'pos_scan_barcode'
  | 'pos_create_order'
  | 'pos_delete_order'
  | 'pos_init_transaction'
  | 'pos_delete_transaction'
  | 'pos_product_lookup'
  | 'pos_sales_completed'
  | 'pos_product_lookup'
  | 'pos_product_lookup_add_to_order'

export interface ILog {
  user_id: string
  action: LogAction
  description?: string
}
