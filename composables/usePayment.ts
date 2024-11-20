const modal = ref(false)

export function usePayment() {
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
