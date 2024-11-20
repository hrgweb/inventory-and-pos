export function useProduct() {
  const notification = useNotification()

  function addToCart() {
    notification.success({ title: 'Added to cart.' })
  }

  return { addToCart }
}
