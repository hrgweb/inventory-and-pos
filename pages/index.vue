<template>
  <div>
    <h2>Home</h2>

    <UButton label="Button" @click="onClick" />
  </div>
</template>

<script setup lang="ts">
function onClick() {
  alert('click me')
}
</script>
