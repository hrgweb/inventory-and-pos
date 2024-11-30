import { serverSupabaseClient } from '#supabase/server'
import { TransactionStatus } from '~/types'

export default defineEventHandler(async (event) => {
  const client = await serverSupabaseClient(event)
  const { transaction_no, amount, total, change } = await readBody(event)

  try {
    const transactionPayload = { status: TransactionStatus.COMPLETED } as never

    // Update transaction status to `completed`
    const { error: transactionError } = await client
      .from('transactions')
      .update(transactionPayload)
      .eq('transaction_no', transaction_no)
      .eq('status', TransactionStatus.PENDING)

    // Transaction fails
    if (transactionError) throw transactionError

    const salesPayload = { transaction_no, amount, total, change } as never

    // Save to sales
    const { error: salesError } = await client
      .from('sales')
      .insert(salesPayload)
      .select()

    // Sales fails
    if (salesError) {
      throw createError({
        statusCode: 500,
        statusMessage: salesError.message
      })
    }

    return true
  } catch (error) {
    throw error
  }
})
