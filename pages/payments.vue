<template>
  <pre>{{ modal }}</pre>

  <div class="p-6">
    <div class="flex items-center justify-between">
      <AppPageTitle title="Payments" />

      <UButton label="New Payments" icon="heroicons:plus" @click="add" />
    </div>

    <UTable :rows="payments" :columns="columns">
      <template #name-data="{ row }"
        ><span>{{ row.name }}</span></template
      >
      <template #actions-data>
        <div class="flex gap-3">
          <Icon class="cursor-pointer text-xl" name="heroicons:pencil" />
          <Icon
            class="cursor-pointer text-xl text-red-500"
            name="heroicons:trash"
          />
        </div>
      </template>
    </UTable>

    <!-- Modal - form -->
    <UModal v-model="modal">
      <UCard class="w-full">
        <template #header>
          <div class="flex items-center justify-between">
            <span>{{ modal_title }}</span>

            <UButton
              icon="heroicons:x-mark"
              variant="soft"
              color="gray"
              class="rounded-full"
              @click="close"
            />
          </div>
        </template>

        <PaymentForm />
      </UCard>
    </UModal>
  </div>
</template>

<script setup lang="ts">
import type { PaymentHeaderTitle, IPayment } from '~/types'

const modal_title = ref<PaymentHeaderTitle>('New Payment')

const columns = [
  {
    key: 'bank_name',
    label: 'Bank Name'
  },
  {
    key: 'account_name',
    label: 'Account Name'
  },
  {
    key: 'account_number',
    label: 'Account Number'
  },
  {
    key: 'account_details',
    label: 'Account Details'
  },
  {
    key: 'actions',
    label: 'Actions'
  }
]

// TODO: Fetch categories from API
const payments = ref<IPayment[]>([
  {
    id: 1,
    bank_name: 'Payment 1',
    account_name: 'Account 1',
    account_number: '123456789',
    account_details: 'Details 1'
  },
  {
    id: 2,
    bank_name: 'Payment 2',
    account_name: 'Account 2',
    account_number: '123456789',
    account_details: 'Details 2'
  },
  {
    id: 3,
    bank_name: 'Payment 3',
    account_name: 'Account 3',
    account_number: '123456789',
    account_details: 'Details 3'
  }
])

const { modal, add, close } = usePayment()
</script>
