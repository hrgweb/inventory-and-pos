import { unitOfMeasurements } from '~/data/unitOfMeasurements'

export function useUom() {
  const getBasicUnits = computed(() => {
    const basicUnits = unitOfMeasurements

    return basicUnits.map(({ label, abbr, value }) => {
      return {
        label,
        abbr,
        value,
        label_formatted: `${abbr} - ${label.toLowerCase()}`
      }
    })
  })

  return { getBasicUnits }
}
