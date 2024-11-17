<template>
  <div class="p-6">
    <h2 class="pb-6">{{ product_header_title }}</h2>

    <ClientOnly>
      <UForm
        :schema="schema"
        :state="state"
        class="space-y-4 w-[500px]"
        @submit="onSubmit"
      >
        <img id="image-preview" src="" alt="Image Preview" />

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
        <UFormGroup label="Mark-up" name="mark_up">
          <UInput v-model="state.mark_up" size="xl" />
        </UFormGroup>
        <UFormGroup label="Final Price" name="price">
          <UInput v-model="state.price" size="xl" />
        </UFormGroup>

        <UButton type="submit" size="lg">Register</UButton>
      </UForm>
    </ClientOnly>
  </div>
</template>

<script setup lang="ts">
import type { ProductHeaderTitle } from '~/types'
import { z } from 'zod'
import type { FormSubmitEvent } from '#ui/types'

const product_header_title = ref<ProductHeaderTitle>('New Product')

const schema = z.object({
  product_name: z.string().min(1),
  description: z.string(),
  supplier_price: z.number().int().gt(0),
  mark_up: z.string(),
  price: z.number().int().gt(0)
})

type Schema = z.output<typeof schema>

const state = reactive({
  thumbnail: null as File | null,
  product_name: '',
  description: '',
  supplier_price: 0,
  mark_up: '',
  price: 0
})

async function onSubmit(event: FormSubmitEvent<Schema>) {
  // Do something with data
  console.log(event.data)
}

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
    }

    reader.readAsDataURL(file)
  } else {
    // handle the case where no files are selected
  }
}
</script>
