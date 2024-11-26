<template>
  <span class="text-orange-500">
    <span v-if="showCurrency">&#8369;</span>
    {{ value ? formatNumber(Number(value)) : '0.00' }}
  </span>
</template>

<script setup lang="ts">
import { formatNumber } from '~/utils'

withDefaults(defineProps<{ value: string; showCurrency?: boolean }>(), {
  value: '0',
  showCurrency: true
})
</script>
