<template>
  <UForm
    :schema="schema"
    :state="state"
    class="space-y-4 w-[500px]"
    @submit="onSubmit"
  >
    <img
      v-show="fileUploaded"
      id="image-preview"
      src=""
      alt="Image Preview"
      :style="{ width: '100%', height: '300px' }"
    />

    <!-- Thumbnail -->
    <UInput
      type="file"
      size="sm"
      icon="i-heroicons-folder"
      id="image-input"
      @change="onUpload"
    />

    <UFormGroup label="Product Name" name="product_name">
      <UInput v-model="state.product_name" size="xl" />
    </UFormGroup>
    <UFormGroup label="Description" name="description">
      <UInput v-model="state.description" size="xl" />
    </UFormGroup>
    <UFormGroup label="Supplier Price" name="supplier_price">
      <UInput v-model="state.supplier_price" size="xl" />
    </UFormGroup>
    <UFormGroup label="Mark-up (%)" name="mark_up">
      <UInput v-model="state.mark_up" size="xl" />
    </UFormGroup>
    <UFormGroup label="Final Price" name="price">
      <UInput v-model="state.price" size="xl" />
    </UFormGroup>
    <UFormGroup label="Category" name="category">
      <UInput v-model="state.category" size="xl" />
    </UFormGroup>
    <UFormGroup label="Quantity" name="qty">
      <UInput v-model="state.qty" size="xl" />
    </UFormGroup>
    <!-- TODO: determine how many products are sold -->
    <UFormGroup label="Sold" name="sold">
      <UInput v-model="state.sold" size="xl" />
    </UFormGroup>
    <UFormGroup label="Barcode" name="barcode">
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
        />
      </div>
    </UFormGroup>

    <UButton type="submit" size="lg">Register</UButton>
  </UForm>
</template>

<script setup lang="ts">
import { z } from 'zod'
import type { FormSubmitEvent } from '#ui/types'

const is_show = ref(false)

const schema = z.object({
  product_name: z.string().min(1),
  description: z.string(),
  supplier_price: z.number().int().gt(0),
  mark_up: z.string(),
  price: z.number().int().gt(0),
  category: z.string(),
  qty: z.number(),
  sold: z.number()
})

type Schema = z.output<typeof schema>

const state = reactive({
  thumbnail: null as File | null,
  product_name: '',
  description: '',
  supplier_price: 0,
  mark_up: '%',
  price: 0,
  category: '',
  qty: 0,
  sold: 0
})

async function onSubmit(event: FormSubmitEvent<Schema>) {
  // Do something with data
  console.log(event.data)
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
      console.log('event: ', event)
      imagePreview.src = event?.target?.result as string
      fileUploaded.value = true

      console.log('image: ', imagePreview.src)
    }

    reader.readAsDataURL(file)
  } else {
    fileUploaded.value = false
    // handle the case where no files are selected
  }
}

const { choose } = useProductBarcode()
</script>
