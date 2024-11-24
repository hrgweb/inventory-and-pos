<template>
  <UForm
    :schema="schema"
    :state="state"
    class="space-y-4 w-[500px] pb-12"
    @submit="onSubmit"
  >
    <!-- <img
      v-show="fileUploaded"
      id="image-preview"
      src=""
      alt="Image Preview"
      :style="{ width: '100%', height: '300px' }"
    /> -->

    <!-- Thumbnail -->
    <!-- <UInput
      type="file"
      size="sm"
      icon="i-heroicons-folder"
      id="image-input"
      @change="onUpload"
    /> -->

    <UFormGroup label="Product Name" name="name">
      <UInput v-model="state.name" size="xl" />
    </UFormGroup>
    <UFormGroup label="Description" name="description">
      <UInput v-model="state.description" size="xl" />
    </UFormGroup>
    <UFormGroup label="Supplier Price" name="supplier_price">
      <UInput v-model.number="state.supplier_price" size="xl" />
    </UFormGroup>
    <UFormGroup label="Mark-up (%)" name="mark_up">
      <UInput v-model.number="state.markup" size="xl" />
    </UFormGroup>
    <UFormGroup label="Final Price" name="price">
      <UInput v-model.number="state.price" size="xl" />
    </UFormGroup>

    <UFormGroup label="Category" name="category_id">
      <USelect
        v-model="state.category_id"
        :options="getCategories"
        size="xl"
        option-attribute="name"
        value-attribute="id"
        placeholder="Select category"
      />
    </UFormGroup>
    <UFormGroup label="Quantity" name="qty">
      <UInput v-model.number="state.qty" size="xl" />
    </UFormGroup>
    <UFormGroup label="Barcode" name="barcode">
      <!-- Barcode SVG -->
      <div v-if="barcode" class="pb-6" v-html="barcodeSvg"></div>

      <div class="flex gap-3">
        <UButton
          label="Scan"
          color="orange"
          icon="heroicons:finger-print-20-solid"
          size="lg"
          @click="choose"
        />
        <UButton
          label="Generate"
          color="blue"
          icon="heroicons:viewfinder-circle"
          size="lg"
          @click="chooseGenerate"
        />
      </div>
    </UFormGroup>

    <div class="text-right">
      <UButton type="submit" size="lg" label="Save New Record" />
    </div>
  </UForm>
</template>

<script setup lang="ts">
import { z } from 'zod'
import type { FormSubmitEvent } from '#ui/types'
import type { IProductFormRequest } from '~/types'

const { choose, chooseGenerate, barcode, barcodeSvg } = useBarcode()
const { create, getCategories } = useProduct()

const schema = z.object({
  name: z.string().min(1, { message: 'Product name is required' }),
  description: z.string(),
  supplier_price: z.number(),
  markup: z.number(),
  price: z.number(),
  category_id: z.string({ message: 'Category is required' }).min(1),
  qty: z.number(),
  barcode: z.string().min(1, { message: 'Barcode is required' })
})

type Schema = z.output<typeof schema>

const state = reactive<IProductFormRequest>({
  name: '',
  description: '',
  supplier_price: 0,
  markup: 0,
  price: 0,
  category_id: undefined,
  qty: 0,
  barcode: '',
  barcode_img: null
})

// Add this watch effect to capture the SVG when it changes
watch(barcodeSvg, (svg) => {
  if (svg) {
    const svgString = svg.toString()
    const base64Svg = btoa(svgString)
    const dataUrl = `data:image/svg+xml;base64,${base64Svg}`

    // Convert base64 to Blob then to File
    fetch(dataUrl)
      .then((res) => res.blob())
      .then((blob) => {
        state.barcode = barcode.value
        state.barcode_img = new File([blob], 'barcode.svg', {
          type: 'image/svg+xml'
        })
      })
  }
})

function reset() {
  state.name = ''
  state.description = ''
  state.supplier_price = 0
  state.markup = 0
  state.price = 0
  state.category_id = undefined
  state.qty = 0
  state.barcode = ''
  state.barcode_img = null
  barcode.value = ''
}

const notification = useNotification()

async function onSubmit(event: FormSubmitEvent<Schema>) {
  const formData = {
    ...event.data,
    barcode_img: state.barcode_img
  }
  await create(formData) // save product
  notification.success({ title: 'Product saved successfully' })
  reset()
}

const fileUploaded = ref(false)
function onUpload(event: Event) {
  const imageInput = document.getElementById('image-input') as HTMLInputElement
  const imagePreview = document.getElementById(
    'image-preview'
  ) as HTMLImageElement

  if (!imageInput || !imagePreview) {
    console.log('No image or preview element found')
    return
  }

  if (imageInput.files && imageInput.files.length) {
    const file = imageInput.files[0]!
    const reader = new FileReader()

    reader.onload = (event) => {
      imagePreview.src = event?.target?.result as string
      fileUploaded.value = true
    }

    reader.readAsDataURL(file)
  } else {
    fileUploaded.value = false
    // handle the case where no files are selected
  }
}
</script>
