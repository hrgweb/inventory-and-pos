<template>
  <div>
    <canvas id="barcode"></canvas>
  </div>
</template>

<script setup lang="ts">
import JsBarcode from 'jsbarcode'

onMounted(() => {
  console.log(JsBarcode)

  // Canvas v1
  var Canvas = require('canvas')
  // Canvas v2
  var { createCanvas } = require('canvas')

  // Canvas v1
  var canvas = new Canvas()
  // Canvas v2
  var canvas = createCanvas()

  JsBarcode(canvas, 'Hello')

  // Do what you want with the canvas
  // See https://github.com/Automattic/node-canvas for more information
})
</script>
