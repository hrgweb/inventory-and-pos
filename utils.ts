export function formatNumber(value: number): string {
  return value.toFixed(2)
}

export function mapItem<T>(item: Partial<Record<keyof T, any>>): T {
  let newItem = {} as T
  for (const prop in item) {
    newItem[prop] = item[prop]
  }
  return newItem
}
