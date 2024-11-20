<template>
  <span class="text-orange-500">&#8369; {{ value }}</span>
</template>

<script setup lang="ts">
withDefaults(defineProps<{ value: string }>(), {
  value: '0'
})
</script>
