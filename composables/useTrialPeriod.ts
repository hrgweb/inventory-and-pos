import {
  differenceInDays,
  differenceInHours,
  differenceInMinutes,
  differenceInSeconds
} from 'date-fns'
import type { ISetting } from '~/types'

interface IDaysRemaining {
  days: number
  hours: number
  minutes: number
  seconds: number
}

export function useTrialPeriod() {
  const expired = useState('trial_period_expired', () => false)
  const tenDaysBeforeExpiry = ref(false)
  const daysRemaining = ref<IDaysRemaining | null>(null)

  const { getSettings, settings } = useSettings()

  async function getTrialPeriod() {
    expired.value = false
    tenDaysBeforeExpiry.value = false

    const data = await getSettings()

    if (!data) return

    const { trial_period_end } = settings.value as ISetting

    const { days, hours, minutes, seconds } = getRemainingTime(
      new Date(trial_period_end!).toISOString()
    ) as IDaysRemaining

    daysRemaining.value = { days, hours, minutes, seconds }

    console.log(
      days,
      'days: ',
      hours,
      'hours: ',
      minutes,
      'minutes: ',
      seconds,
      'seconds: '
    )

    // 10 days remaining before expiry
    if (days <= 10) {
      tenDaysBeforeExpiry.value = true
    }

    // Trial period expired
    if (days <= 0 && hours <= 0 && minutes <= 0 && seconds <= 0) {
      expired.value = true
      return
    }
  }

  /**
   * Calculates the remaining time from the current date and time to the specified end time.
   * @param endTime - The end time in ISO format (e.g., '2024-11-30T08:30:00').
   * @returns An object containing the remaining days, hours, minutes, and seconds.
   */
  function getRemainingTime(endTime: string): IDaysRemaining {
    const currentDate = new Date()
    const endDate = new Date(endTime)

    const totalSeconds = differenceInSeconds(endDate, currentDate)
    const days = differenceInDays(endDate, currentDate)
    const hours = differenceInHours(endDate, currentDate) % 24
    const minutes = differenceInMinutes(endDate, currentDate) % 60
    const seconds = totalSeconds % 60

    return { days, hours, minutes, seconds }
  }

  return { tenDaysBeforeExpiry, expired, getTrialPeriod, daysRemaining }
}
