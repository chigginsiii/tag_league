import { Course } from "./course";

export type Id = number | string

export interface League {
  id: Id
  name: string
}

export interface LeagueSeries {
  title: string
  league: League
  date_start: string
  date_end: string
}

export interface SeriesEvent {
  league_series: LeagueSeries
  title: string
  event_start_time: string
  event_end_time: string
  course: Course
  num_rounds: number
}