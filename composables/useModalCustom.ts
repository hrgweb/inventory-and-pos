export function useModalCustom<MV extends string = 'none'>() {
  const modal = ref<MV>('none' as MV)
  const showModal = computed(() => (modal.value !== 'none' ? true : false))
  const componentToUse = shallowRef<object>({})

  return { modal, showModal, componentToUse }
}
