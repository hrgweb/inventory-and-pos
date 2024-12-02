<template>
  <UCard>
    <UInput
      ref="lookup_input"
      class="w-full mb-6"
      size="xl"
      icon="heroicons:magnifying-glass"
      placeholder="Scan product barcode"
    />

    <UTable :rows="items" :columns="columns">
      <template #name-data="{ row }">
        <span>{{ row.name }}</span>
      </template>
      <template #actions-data="{ row, index }">
        <div class="flex gap-3">
          <Icon
            class="cursor-pointer text-xl text-orange-500"
            name="heroicons:pencil"
          />

          <UPopover>
            <Icon
              class="cursor-pointer text-xl text-red-500"
              name="heroicons:trash"
            />

            <template #panel="{ close }">
              <div class="p-4">
                <p>
                  Delete <b>{{ row.name }}?</b>?
                </p>

                <div>
                  <UButton label="Yes" color="red" />
                  <UButton
                    label="No"
                    color="white"
                    variant="ghost"
                    @click="close"
                  />
                </div>
              </div>
            </template>
          </UPopover>
        </div>
      </template>
    </UTable>
  </UCard>
</template>

<script setup lang="ts">
import { useFocus, useMagicKeys } from '@vueuse/core'

const lookup_input = ref()
const { focused } = useFocus(lookup_input, { initialValue: true })
const { escape } = useMagicKeys()

const columns = [
  {
    key: 'name',
    label: 'Product Name'
  },
  {
    key: 'barcode',
    label: 'Barcode'
  },
  {
    key: 'selling_price',
    label: 'Selling Price'
  }
]

const items = ref([])

const emit = defineEmits<{
  close: [void]
}>()

watchEffect(() => {
  if (escape.value) {
    emit('close')
  }
})

onMounted(() => {
  focused.value = true
})
</script>
