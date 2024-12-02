import { z } from 'zod'

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

export function imageSchema() {
  // Define allowed MIME types for images
  const ACCEPTED_IMAGE_TYPES = [
    'image/jpeg',
    'image/jpg',
    'image/png',
    'image/webp',
    'image/gif',
    'image/svg+xml'
  ]

  const MAX_FILE_SIZE = 2 * 1024 * 1024 // 5MB

  const imageSchema = z.object({
    file: z
      .custom<File>()
      .refine((file) => file instanceof File, {
        message: 'File is required'
      })
      .refine((file) => file.size <= MAX_FILE_SIZE, {
        message: `File size should be less than 2MB`
      })
      .refine((file) => ACCEPTED_IMAGE_TYPES.includes(file.type), {
        message: 'Only .jpg, .jpeg, .png, .webp and .gif formats are supported'
      })
  })
  return imageSchema
}

export function generateHash(len = 24) {
  const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'
  // const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789'
  let result = ''
  for (let i = 0; i < len; i++) {
    result += chars.charAt(Math.floor(Math.random() * chars.length))
  }
  return result
}

export const DATA_SERIALIZER = {
  serializer: {
    read: (v: any) => (v ? JSON.parse(v) : null),
    write: (v: any) => JSON.stringify(v)
  }
}
