import Quagga from 'quagga' // ES6

const data = ref(null)

export function useQuagga() {
  const _this = ref<Quagga | null>(Quagga)

  function init(element: HTMLDivElement | null): void {
    const configs = {
      numOfWorkers: (self.navigator.hardwareConcurrency as number) / 2 || 1,
      locate: true,
      inputStream: {
        name: 'Live',
        type: 'LiveStream',
        target: element,
        constraints: {
          width: 640,
          height: 480,
          facingMode: 'environment'
        },
        area: {
          // defines rectangle of the detection/localization area
          top: '0%', // top offset
          right: '0%', // right offset
          left: '0%', // left offset
          bottom: '0%' // bottom offset
        },
        singleChannel: false // true: only the red color-channel is read
      },
      frequency: 10,
      decoder: {
        readers: ['code_128_reader']
      },
      halfSample: true,
      patchSize: 'medium' // x-small, small, medium, large, x-large
    }

    Quagga.init(configs, function (err: Error) {
      if (err) {
        console.log(err)
        return
      }
      console.log('Initialization finished. Ready to start')
      Quagga.start()
    })
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
