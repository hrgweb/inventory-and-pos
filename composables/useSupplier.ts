export function useSupplier() {
  const {
    fetch,
    create,
    update,
    remove,
    is_add,
    selected,
    list,
    selected_index,
    search,
    reset
  } = useCrud()

  return {
    fetch,
    create,
    update,
    remove,
    is_add,
    selected,
    list,
    selected_index,
    search,
    reset
  }
}
