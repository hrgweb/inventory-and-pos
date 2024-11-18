import BarcodeChoose from '~/components/product/ProductBarcodeChoose.vue'
import BarcodeScanner from '~/components/product/ProductBarcodeScanner.vue'
import BarcodeGenerate from '~/components/product/ProductBarcodeGenerate.vue'
import type { BarcodeOptions } from '~/types'

// barcode
import JsBarcode from 'jsbarcode'
import { DOMImplementation, XMLSerializer } from 'xmldom'

const modal = ref<BarcodeOptions>('none')
const componentToUse = shallowRef(BarcodeChoose)

export function useBarcode() {
  const barcodeSvg = ref<HTMLOrSVGElement | string | null>(null)

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

  function generate(): string {
    const xmlSerializer = new XMLSerializer()
    const document = new DOMImplementation().createDocument(
      'http://www.w3.org/1999/xhtml',
      'html',
      null
    )
    const svgNode = document.createElementNS(
      'http://www.w3.org/2000/svg',
      'svg'
    )

    JsBarcode(svgNode, 'test', {
      xmlDocument: document
    })

    return xmlSerializer.serializeToString(svgNode)
  }

  function chooseGenerate() {
    barcodeSvg.value = generate()
  }

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
    chooseGenerate,
    barcodeSvg
  }
}
