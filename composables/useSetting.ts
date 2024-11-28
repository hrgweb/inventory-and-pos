import type { ISetting, ISettingFormRequest } from '~/types'
import { addDays } from 'date-fns'

export function useSetting() {
  const http = useHttp()

  async function create({ trial_period_days }: ISettingFormRequest) {
    if (!trial_period_days) return

    const _trial_period_days = +trial_period_days
    const payload = {
      trial_period_days: _trial_period_days,
      trial_period_start: new Date(),
      trial_period_end: addDays(new Date(), _trial_period_days)
    } as ISettingFormRequest

    const data = await http.post<ISetting, ISettingFormRequest>(
      '/api/settings',
      payload
    )
    console.log(data)
  }

  return { create }
}
