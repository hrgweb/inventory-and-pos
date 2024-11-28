<template>
  <div>
    <h2>Playground</h2>

    <!-- <pre>{{ categories }}</pre> -->

    <UButton label="Save" @click="save" />
  </div>
</template>

<script setup lang="ts">
definePageMeta({ layout: 'none' })

async function save() {
  const { category } = await $fetch('/api/categories', {
    method: 'POST',
    body: JSON.stringify({
      name: 'pizza'
    })
  })

  console.log(category)
}
</script>
