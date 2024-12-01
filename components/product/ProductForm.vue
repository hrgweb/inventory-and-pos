<template>
  <div>
    <div class="flex justify-between items-center pb-6">
      <AppPageTitle title="New Product" />

      <UButton
        class="rounded-full"
        color="white"
        icon="heroicons:x-mark-solid"
        variant="ghost"
        @click="onClose"
      />
    </div>

    <UForm :schema="schema" :state="form" class="space-y-4" @submit="onSubmit">
      <UFormGroup label="Barcode" name="barcode">
        <div class="flex">
          <UInput v-model="form.barcode" size="xl" class="w-full" />
          <UButton
            label="Generate"
            color="white"
            icon="heroicons:viewfinder-circle"
            size="lg"
            @click="onBarcodeGenerate"
          />
        </div>
      </UFormGroup>
      <UFormGroup label="Product Name" name="name">
        <UInput v-model="form.name" size="xl" />
      </UFormGroup>
      <UFormGroup label="Description" name="description">
        <UInput v-model="form.description" size="xl" />
      </UFormGroup>
      <UFormGroup label="Category" name="category_id">
        <USelect
          v-model="form.category_id"
          :options="categories"
          size="xl"
          option-attribute="name"
          value-attribute="id"
          placeholder="Select category"
        />
      </UFormGroup>
      <UFormGroup label="Cost Price" name="cost_price">
        <UInput v-model.number="form.cost_price" size="xl" />
      </UFormGroup>
      <UFormGroup label="Selling Price" name="selling_price">
        <UInput v-model.number="form.selling_price" size="xl" />
      </UFormGroup>

      <UFormGroup label="Stock Qty" name="stock_qty">
        <UInput v-model.number="form.stock_qty" size="xl" />
      </UFormGroup>
      <UFormGroup label="Reorder Level" name="reorder_level">
        <UInput v-model.number="form.reorder_level" size="xl" />
      </UFormGroup>

      <div class="text-left space-x-3 pt-6">
        <UButton v-if="isAdd" type="submit" size="lg" label="Save Record" />
        <UButton
          v-else
          type="button"
          size="lg"
          label="Update Record"
          color="orange"
          @click="onUpdate"
        />
        <UButton
          type="button"
          size="lg"
          label="Cancel"
          variant="ghost"
          color="white"
          @click="onClose"
        />
      </div>
    </UForm>
  </div>
</template>

<script setup lang="ts">
import { z } from 'zod'
import type { FormSubmitEvent } from '#ui/types'
import type { IProductFormRequest } from '~/types'

const { chooseGenerate, barcode, barcodeSvg } = useBarcode()
const { create, isAdd, selected, update } = useProduct()
const { list: categories } = useCategory()

const schema = z.object({
  barcode: z.string().min(1, { message: 'Barcode is required' }),
  name: z.string().min(1, { message: 'Product name is required' }),
  description: z.string(),
  category_id: z.string({ message: 'Category is required' }).min(1),
  cost_price: z.number().min(1, { message: 'Cost price is required' }),
  selling_price: z.number().min(1, { message: 'Selling price is required' }),
  stock_qty: z.number().min(1, { message: 'Stock qty is required' }),
  reorder_level: z.number().min(1, { message: 'Reorder Level is required' })
})

type Schema = z.output<typeof schema>

const state = reactive<IProductFormRequest>({
  name: '',
  description: '',
  cost_price: 0,
  selling_price: 0,
  stock_qty: 0,
  reorder_level: 0,
  category_id: undefined,
  barcode: '',
  barcode_img: null
})

const editState = reactive<IProductFormRequest>({
  id: '',
  name: '',
  description: '',
  cost_price: 0,
  selling_price: 0,
  stock_qty: 0,
  reorder_level: 0,
  category_id: undefined,
  barcode: '',
  barcode_img: null
})

function reset() {
  // Add
  state.name = ''
  state.description = ''
  state.cost_price = 0
  state.selling_price = 0
  state.stock_qty = 0
  state.reorder_level = 0
  state.category_id = undefined
  state.barcode = ''
  state.barcode_img = null

  // Edit
  editState.name = ''
  editState.description = ''
  editState.cost_price = 0
  editState.selling_price = 0
  editState.stock_qty = 0
  editState.reorder_level = 0
  editState.category_id = undefined
  editState.barcode = ''
  editState.barcode_img = null

  barcode.value = ''
}

const notification = useNotification()

async function onSubmit(event: FormSubmitEvent<Schema>) {
  const payload = {
    barcode_img: state.barcode_img,
    ...event.data
  }
  await create(event.data)
  notification.success({ title: '1 product saved successfully' })
  setTimeout(() => reset(), 100)
  onClose()
}

const emit = defineEmits<{
  close: [void]
}>()

function onClose() {
  isAdd.value = false
  emit('close')
}

const form = computed(() => (isAdd.value ? state : editState))

// Watch for the isAdd value
watchEffect(() => {
  if (isAdd.value) {
    console.log('add')
    return
  }

  // Edit
  const product = selected.value
  editState.id = product?.id
  editState.name = product?.name
  editState.description = product?.description
  editState.cost_price = product?.cost_price
  editState.selling_price = product?.selling_price
  editState.stock_qty = product?.stock_qty
  editState.reorder_level = product?.reorder_level
  editState.category_id = product?.category_id
  editState.stock_qty = product?.stock_qty
})

async function onUpdate() {
  const product = editState
  await update(product)
  notification.info({ title: 'Product updated successfully' })
  emit('close')
}

function onBarcodeGenerate() {
  chooseGenerate()
  state.barcode = barcode.value as string
}
</script>
