import Quagga from 'quagga' // ES6

const data = ref(null)

export function useQuagga() {
  const _this = ref<Quagga | null>(Quagga)

  function init(element: HTMLDivElement | null): void {
    Quagga.init(
      {
        inputStream: {
          name: 'Live',
          type: 'LiveStream',
          target: element
        },
        decoder: {
          readers: [
            'code_128_reader' // Supports Code 128
          ]
        }
      },
      function (err: Error) {
        if (err) {
          console.log(err)
          return
        }
        console.log('Initialization finished. Ready to start')
        Quagga.start()
      }
    )
  }

  async function detect(cb: Function): Promise<any | null> {
    Quagga.onDetected(cb)
  }

  return {
    init,
    detect,
    data,
    _this
  }
}
