import type { ISetting, ISettingFormRequest, ISettingResponse } from '~/types'
import { addDays } from 'date-fns'

export function useSettings() {
  const settings = useState<ISettingResponse | null>('settings', () => null)

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
    return data
  }

  async function update({ trial_period_days }: ISettingFormRequest) {
    if (!trial_period_days) return

    const _trial_period_days = +trial_period_days
    const payload = {
      id: settings.value?.id,
      trial_period_days: _trial_period_days,
      trial_period_start: new Date(),
      trial_period_end: addDays(new Date(), _trial_period_days)
    } as ISettingFormRequest

    const data = await http.update<ISetting, ISettingFormRequest>(
      '/api/settings',
      payload
    )
    return data
  }

  async function getSettings() {
    const data = await http.getOne<ISettingResponse>('/api/settings')

    if (!data) return null

    settings.value = data as ISettingResponse

    return data
  }

  return { create, getSettings, settings, update }
}
