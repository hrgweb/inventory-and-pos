import BarcodeChoose from '~/components/product/ProductBarcodeChoose.vue'
import BarcodeScanner from '~/components/product/ProductBarcodeScanner.vue'
import BarcodeGenerate from '~/components/product/ProductBarcodeGenerate.vue'
import type { BarcodeOptions } from '~/types'

const modal = ref<BarcodeOptions>('choose')
const componentToUse = shallowRef(BarcodeChoose)

export function useProductBarcode() {
  watch(modal, (value) => {
    console.log('watched: ', value)

    switch (value) {
      case 'webcam':
        componentToUse.value = BarcodeScanner
        break
      case 'scanner':
        componentToUse.value = BarcodeScanner
        break
      default:
        componentToUse.value = BarcodeChoose
    }
  })

  function choose() {
    modal.value = 'choose'
  }

  function chooseWebcam() {
    modal.value = 'webcam'
  }

  function chooseBarcodeScanner() {
    modal.value = 'scanner'
  }

  function chooseGenerate() {}

  function closeModal() {
    modal.value = 'none'
  }

  return {
    modal,
    componentToUse,
    chooseWebcam,
    chooseBarcodeScanner,
    choose,
    closeModal,
    chooseGenerate
  }
}
