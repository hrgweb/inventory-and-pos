<template>
  <UAlert
    icon="heroicons:exclamation-triangle"
    :description="`Your trial period will end on ${end_date}. Please renew your subscription before the end date to continue using our services.`"
    title="Heads up!"
    variant="solid"
    color="red"
    :ui="{ rounded: 'rounded-none' }"
  />
</template>

<script setup lang="ts">
import { format } from 'date-fns'

interface Props {
  endDate?: Date
  isShow?: boolean
}

const { endDate = new Date(), isShow = false } = defineProps<Props>()

const end_date = computed(() => format(endDate, 'PPppp'))
</script>
