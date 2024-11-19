interface INotification {
  title: string
  description?: string
  color?: string
}

export function useNotification() {
  const toast = useToast()

  function success({ title, description }: INotification): void {
    toast.add({
      id: 'notif_success',
      title,
      description,
      color: 'green'
    })
  }

  function error({ title, description }: INotification): void {
    toast.add({
      title,
      description,
      color: 'red'
    })
  }

  function info({ title, description }: INotification): void {
    toast.add({
      title,
      description,
      color: 'blue'
    })
  }

  function warning({ title, description }: INotification): void {
    toast.add({
      title,
      description,
      color: 'orange'
    })
  }

  return { success, error, warning, info }
}
