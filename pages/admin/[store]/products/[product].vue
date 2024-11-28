<template>
  <div class="p-6 flex gap-12 md:w-[900px]">
    <img
      :src="product?.thumbnail"
      :alt="product?.product_name"
      :style="{ width: '400px', height: '400px' }"
    />
    <div class="flex flex-col flex-1 space-y-3 h-full relative">
      <h2 class="text-3xl font-medium">{{ product?.product_name }}</h2>
      <div class="flex justify-between items-center text-xl py-3 w-full">
        <span>Price</span>
        <SharedDisplayNumber :value="product?.price_formatted" />
      </div>
      <div class="flex justify-between items-center">
        <span>Available</span>
        <!-- TODO: replace how many is available -->
        <span>100</span>
      </div>
      <div class="flex justify-between items-center">
        <span>Sold</span>
        <!-- TODO: replace how many is sold -->
        <span>0</span>
      </div>
      <div class="flex justify-between items-center">
        <span>Share</span>
        <!-- TODO: social media links -->
        <span>social media links</span>
      </div>

      <div class="flex justify-between items-center">
        <span>Copy Link</span>

        <UInput v-model="copy_link" size="xl" disabled />
        <UButton
          icon="heroicons:clipboard"
          color="gray"
          class="relative -right-[0.6rem] z-10"
          size="xl"
          @click.stop="copyToClipBoard"
        />
      </div>
      <br />

      <UButton
        label="Add to Cart"
        color="green"
        icon="heroicons:shopping-cart"
        size="xl"
        @click="addToCart"
      />
    </div>
  </div>
</template>

<script setup lang="ts">
import type { IProduct } from '~/types'
import { useClipboard } from '@vueuse/core'

definePageMeta({
  layout: 'view'
})

const { getProducts } = useStore()
const { addToCart } = useProduct()

// TODO: need to get the product
const product = computed<IProduct>(
  () => getProducts.value?.filter((p) => p.id === +useRoute().params.product)[0]
)

const copy_link = ref(product.value?.copy_link)
const { copy, copied, isSupported } = useClipboard({
  source: copy_link,
  copiedDuring: 10000
})

const notification = useNotification()

function copyToClipBoard() {
  copy()
  notification.success({ title: 'Copy to clipboard.' })
}
</script>
