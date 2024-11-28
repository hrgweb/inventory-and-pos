import type { ISetting, ISettingFormRequest, ISettingResponse } from '~/types'
import { addDays, parseISO } from 'date-fns'

const settings = ref<ISettingResponse | null>(null)

export function useSettings() {
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

  async function getSettings() {
    const data = await http.getOne<ISettingResponse>('/api/settings')

    if (!data) return null

    settings.value = data as ISettingResponse
  }

  // const getTrialPeriodEndDate = computed<Date | null>(() => {
  //   const _settings = settings.value

  //   return _settings && _settings.trial_period_end
  //     ? parseISO(_settings.trial_period_end.toISOString())
  //     : null
  // })

  return { create, getSettings, settings }
}
