import { Course } from "./course";

export type Id = number | string

export interface League {
  id: Id
  name: string
  league_series?: LeagueSeries
}

export interface LeagueSeries {
  title: string
  date_start: string
  date_end: string
  current_event: SeriesEvent
  next_event: SeriesEvent
}

export interface EventRound {
  round_num: number
  course: string
}
export interface SeriesEvent {
  league_series: LeagueSeries
  title: string
  event_start_time: string
  event_end_time: string
  event_rounds: EventRound[]
}