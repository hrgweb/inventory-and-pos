<template>
  <div>
    <div class="flex justify-between items-center pb-6">
      <AppPageTitle :title="`${isAdd ? 'New' : 'Edit'}  Product`" />

      <UButton
        class="rounded-full"
        color="white"
        icon="heroicons:x-mark-solid"
        variant="ghost"
        @click="onClose"
      />
    </div>

    <UForm
      ref="productForm"
      :schema="schema"
      :state="form"
      class="space-y-4"
      @submit="onSubmit"
    >
      <!-- Barcode SVG -->
      <div
        v-if="barcode && isAdd"
        class="w-full barcode-svg"
        v-html="barcodeSvg"
      ></div>
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
        <USelectMenu
          v-model="form.category_id"
          :options="categories"
          size="xl"
          option-attribute="name"
          value-attribute="id"
          placeholder="Select category"
        />
      </UFormGroup>

      <div class="flex gap-3">
        <UFormGroup label="Cost Price" name="cost_price" class="flex-1">
          <UInput v-model.number="form.cost_price" size="xl" />
        </UFormGroup>
        <UFormGroup label="Selling Price" name="selling_price" class="flex-1">
          <UInput v-model.number="form.selling_price" size="xl" />
        </UFormGroup>
      </div>

      <div class="flex gap-3">
        <UFormGroup label="Reorder Level" name="reorder_level" class="flex-1">
          <UInput v-model.number="form.reorder_level" size="xl" />
        </UFormGroup>
      </div>

      <div class="flex gap-3">
        <UFormGroup label="U/m" name="uom_number" class="flex-1">
          <UInput v-model.number="form.uom_number" size="xl" />
        </UFormGroup>
        <UFormGroup label="U/m" name="uom" class="flex-1">
          <USelectMenu
            v-model="form.uom"
            :options="basic_units"
            size="xl"
            option-attribute="label_formatted"
            value-attribute="abbr"
            placeholder="Select unit of measurement"
          />
        </UFormGroup>
        <UFormGroup
          :label="`Qty (${form?.uom})`"
          name="stock_qty"
          class="flex-[3]"
        >
          <UInput v-model.number="form.stock_qty" size="xl" />
        </UFormGroup>
      </div>

      <div v-if="false" class="flex gap-3">
        <UFormGroup label="Weight" name="weight" class="flex-1">
          <UInput v-model.number="form.weight" size="xl" />
        </UFormGroup>
        <UFormGroup label="Volume" name="volume" class="flex-1">
          <UInput v-model.number="form.volume" size="xl" />
        </UFormGroup>
      </div>

      <div class="text-left space-x-3 pt-6">
        <UButton
          type="submit"
          size="lg"
          :label="`${isAdd ? 'Save' : 'Update'} Record`"
          :color="`${isAdd ? 'green' : 'orange'}`"
          :loading="is_loading"
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
  reorder_level: z.number().min(1, { message: 'Reorder level is required' }),
  uom: z.string().min(1, { message: 'Unit of measurement is required' }),
  uom_number: z
    .number()
    .min(1, { message: 'Unit of measurement number is required' }),
  weight: z.number(),
  volume: z.number()
})

type Schema = z.output<typeof schema>

const state = reactive<IProductFormRequest>({
  name: '',
  description: '',
  cost_price: 0,
  selling_price: 0,
  stock_qty: 0,
  reorder_level: 0,
  category_id: '',
  barcode: '',
  barcode_img: null,
  uom_number: 0,
  uom: 'pc',
  weight: 0,
  volume: 0
})

const editState = reactive<IProductFormRequest>({
  id: '',
  name: '',
  description: '',
  cost_price: 0,
  selling_price: 0,
  stock_qty: 0,
  reorder_level: 0,
  category_id: '',
  barcode: '',
  barcode_img: null,
  uom: 'pc',
  weight: 0,
  volume: 0
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

const emit = defineEmits<{
  close: [void]
}>()

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
  editState.barcode = product?.barcode
  editState.name = product?.name
  editState.description = product?.description
  editState.cost_price = product?.cost_price
  editState.selling_price = product?.selling_price
  editState.stock_qty = product?.stock_qty
  editState.reorder_level = product?.reorder_level
  editState.category_id = product?.category_id
  editState.stock_qty = product?.stock_qty
  editState.uom = product?.uom
  editState.uom_number = product?.uom_number
  editState.weight = product?.weight
  editState.volume = product?.volume
})

async function onSubmit(event: FormSubmitEvent<Schema>) {
  // Create
  if (isAdd.value) {
    const { ...body } = event.data
    await create(body)
    notification.success({ title: '1 product created successfully' })
  }
  // Update
  else {
    const { ...body } = editState
    await update(body)
    notification.info({ title: '1 product updated successfully' })
  }

  setTimeout(() => reset(), 100)
  onClose()
}

function onClose() {
  emit('close')
}

function onBarcodeGenerate() {
  chooseGenerate()
  state.barcode = barcode.value as string
  editState.barcode = barcode.value as string
}

const { isLoading: is_loading } = useHttp()
const { getBasicUnits: basic_units } = useUom()
</script>

<style>
.barcode-svg > svg {
  width: 100%;
}
</style>
