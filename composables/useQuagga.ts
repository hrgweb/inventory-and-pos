import Quagga from 'quagga' // ES6

export function useQuagga() {
  function init(element: HTMLDivElement | null): void {
    Quagga.init(
      {
        inputStream: {
          name: 'Live',
          type: 'LiveStream',
          target: element
        },
        locate: true,
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

  function detect(): void {
    Quagga.onDetected((data: any) => {
      console.log('Barcode detected:', data)

      const result = data.codeResult.code
      // document.getElementById('barcode-result').textContent = result

      console.log(result)

      // Stop the scanner after detection
      Quagga.stop()
    })
  }

  return {
    init,
    detect
  }
}
