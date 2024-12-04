import { serverSupabaseClient } from '#supabase/server'
import { IOrder, IOrderResponse, TransactionStatus } from '~/types'

export default defineEventHandler(async (event) => {
  const supabase = await serverSupabaseClient(event)
  const { transaction_no, amount, total, change, orders, user_id } =
    await readBody(event)

  function mapItems(items: IOrderResponse[]) {
    const data = [...items]

    const result = [] as IOrderResponse[]
    const productIdCountMap = {} as Record<string, any>

    data.forEach((item) => {
      const { product } = item
      const productId = product.id

      if (!productIdCountMap[productId]) {
        productIdCountMap[productId] = 1
        result.push({ ...item, product_id_count: 1 })
      } else {
        productIdCountMap[productId]++

        const existingItem = result.find((i) => i.product.id === productId)

        if (existingItem) {
          existingItem.product_id_count = productIdCountMap[productId]
        }
      }
    })

    return result
  }

  async function adjustStockQty(items: IOrderResponse[]) {
    for (const item of items) {
      const { product, ...args } = item

      // Get stock qty of each product
      const { data, error: getStockError } = await supabase
        .from('products')
        .select('stock_qty')
        .eq('id', product.id!)

      if (getStockError) throw getStockError

      // Deduct stock qty
      const _data = (data && data.length ? data[0] : data) as {
        stock_qty: number
      }
      const stockQty = +_data.stock_qty - +args.product_id_count!

      // Update stock
      const { error: updateStockError } = await supabase
        .from('products')
        .update({ stock_qty: stockQty } as never)
        .eq('id', product.id)

      if (updateStockError) throw updateStockError
    }

    return true
  }

  try {
    const transactionPayload = { status: TransactionStatus.COMPLETED } as never

    // Update transaction status to `completed`
    const { error: transactionError } = await supabase
      .from('transactions')
      .update(transactionPayload)
      .eq('transaction_no', transaction_no)
      .eq('status', TransactionStatus.PENDING)

    // Transaction fails
    if (transactionError) throw transactionError

    const salesPayload = {
      user_id,
      transaction_no,
      amount,
      total,
      change
    } as never

    // Save to sales
    const { error: salesError } = await supabase
      .from('sales')
      .insert(salesPayload)
      .select()

    // Sales fails
    if (salesError) throw salesError

    // Adjust stock qty of each product
    const _items = mapItems(orders)
    await adjustStockQty(_items)

    return true
  } catch (error) {
    throw error
  }
})
