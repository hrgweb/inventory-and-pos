import BarcodeChoose from '~/components/product/ProductBarcodeChoose.vue'
import BarcodeScanner from '~/components/product/ProductBarcodeScanner.vue'
import BarcodeGenerate from '~/components/product/ProductBarcodeGenerate.vue'
import type { BarcodeOptions } from '~/types'

// barcode
import JsBarcode from 'jsbarcode'
import { DOMImplementation, XMLSerializer } from 'xmldom'

export function useBarcode() {
  const modal = ref<BarcodeOptions>('none')
  const componentToUse = shallowRef(BarcodeChoose)
  const barcodeSvg = ref<HTMLOrSVGElement | string | null>(null)
  const barcode = useState('product_barcode', () => '')
  const barcodeSvgFile = ref<File | null>(null)

  const quagga = useQuagga() // scanner

  watch(modal, (value) => {
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

  onMounted(() => {
    const scannderDiv = document.getElementById('media') as HTMLDivElement

    if (!scannderDiv) {
      return
    }

    quagga.init(scannderDiv)
    quagga.detect((data: any) => {
      console.log('Barcode detected:', data)

      const result = data.codeResult.code
      console.log('barcode: ', result)

      quagga.data.value = result

      // Stop the scanner after detection
      quagga._this.value.stop()

      closeModal()
    })
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

  function generateBarcode(len = 12) {
    const chars =
      // 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789'
      '0123456789'
    let result = ''
    for (let i = 0; i < len; i++) {
      result += chars.charAt(Math.floor(Math.random() * chars.length))
    }
    return result
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

    const code = generateBarcode(12)
    barcode.value = code
    JsBarcode(svgNode, code, {
      xmlDocument: document,
      format: 'CODE128',
      displayValue: true,
      fontSize: 16,
      lineColor: '#000',
      width: 3,
      height: 100,
      margin: 10
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
    barcodeSvg,
    barcode
  }
}
