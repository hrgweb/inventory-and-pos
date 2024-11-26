import { serverSupabaseClient } from '#supabase/server'
import { ITransaction, TransactionStatus } from '~/types'
import { generateHash } from '~/utils'

export default defineEventHandler(async (event) => {
  async function getOne(): Promise<ITransaction> {
    const { data, error } = await client
      .from('transactions')
      .select()
      .eq('status', TransactionStatus.PENDING)
    if (error) throw error
    return data[0]
  }

  // TODO: update the types
  async function create(): Promise<any> {
    const payload = { transaction_no: generateHash(22) } as never

    const { data, error } = await client
      .from('transactions')
      .insert(payload)
      .select()
    if (error) throw error
    return data[0]
  }

  const client = await serverSupabaseClient(event)

  const data = await getOne()

  // If no transaction found
  if (!data) {
    // Create new transaction
    const transaction = await create()
    return transaction
  }

  return data
})
