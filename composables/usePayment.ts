export function usePayment() {
  const modal = ref(false)
  const isAdd = ref(false)

  function add() {
    isAdd.value = true
    modal.value = true
  }

  function close() {
    modal.value = false
    isAdd.value = false
  }

  return {
    modal,
    close,
    add
  }
}
