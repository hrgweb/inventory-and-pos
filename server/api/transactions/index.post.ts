import { serverSupabaseClient } from '#supabase/server'
import { ITransaction, TransactionStatus } from '~/types'

export default defineEventHandler(async (event) => {
  const client = await serverSupabaseClient(event)

  const data = await getOne()

  // If no transaction found
  if (!data) {
    // Create new order
    const order = await createOrder()
    console.log(order)

    // Create new transaction
    const transaction = await create({ order_id: order.id })
    console.log('if: ', transaction)
    return { transaction }
  }

  console.log('else: ', data)
  return { transaction: data }

  async function getOne(): Promise<ITransaction> {
    const { data, error } = await client
      .from('transactions')
      .select()
      .eq('status', TransactionStatus.PENDING)
    if (error) throw error
    return data[0]
  }

  // TODO: update the types
  async function create({ order_id }: { order_id: number }): Promise<any> {
    const { transaction_no } = await readBody(event)
    const payload = {
      transaction_no,
      order_id
    } as never

    const { data, error } = await client
      .from('transactions')
      .insert(payload)
      .select()
    if (error) throw error
    return data[0]
  }

  // TODO: update the types
  async function createOrder(): Promise<any> {
    const payload = {} as never
    const { data, error } = await client.from('orders').insert(payload).select()
    if (error) throw error
    return data[0]
  }
})
