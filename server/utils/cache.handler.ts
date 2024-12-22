const storage = useStorage('redis')

export async function get<T>(table: string): Promise<T | null> {
  return (await storage.getItem(table)) as T | null
}

export function hasCached<T, B>(table: string, cachedData: B): boolean {
  if (cachedData) {
    console.log(`${table}: get data from cached`)
    return true
  }
  return false
}

export async function set<T>(table: string, data: any): Promise<void> {
  console.log(`${table}: not cached yet let's cache it`)
  await storage.setItem(table, data)
}

export async function remove(table: string): Promise<void> {
  console.log(`${table}: cached data removed`)
  await storage.removeItem(table)
}
