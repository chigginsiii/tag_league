import React, { useEffect, useState } from 'react'
import moment from 'moment-timezone'
import countdown from 'countdown'
require('moment-countdown')
import { RouteComponentProps } from '@reach/router'
import { League, EventRound, SeriesEvent } from '../../types/league'
import TextBox from '../style/textBox'
import Panel from '../style/panel'
import Layout from '../layout'
import Box from '../style/box';

const formatDatetime = (time: string, zone: string) =>
  moment.tz(time, zone).format("dddd, MMMM Do YYYY, h:mm a")

const EventInfo = ({ heading, event, timezone }: { heading: string, event: SeriesEvent, timezone: string }) => {
  const { title, event_start_time: start_time, event_end_time: end_time } = event
  const now = moment()
  const start = moment(start_time)
  const end = moment(end_time)

  console.log(`EventInfo: ${title}`)
  console.log({ now: now.toString(), start: start.toString(), end: end.toString(), now_is_before_start: now.isBefore(start) })

  const initCountdown = now.isBefore(start) ? countdown(start.toDate(), now.toDate()).toString() : null
  const [eventCountdown, setCountdown] = useState<string | null>(initCountdown)
  useEffect(() => {
    if (now.isBefore(start)) {
      setInterval(() => {
        setCountdown(countdown(start.toDate()).toString())
      }, 1000)
    }
  }, [])

  return (<Box mt={16}>
    <TextBox lg base>
      {heading}: {event.title}
    </TextBox>
    <TextBox dark><ul>
      <li key="start">Starts {formatDatetime(event.event_start_time, timezone)}</li>
      <li key="countdown">{eventCountdown}</li>
      {eventCountdown ? (<li key="ends">Ends {formatDatetime(event.event_end_time, timezone)}</li>) : null}
      {event.event_rounds.map((r: EventRound) =>
        <li key={r.round_num}>
          Round {r.round_num} at: {r.course}
        </li>
      )}
    </ul></TextBox>
  </Box>)

}


interface LeagueLandingProps extends RouteComponentProps<{ league_id: string }> { }

const LeagueLanding = ({ league_id }: LeagueLandingProps) => {
  const [league, setLeague] = useState<League | null>(null)

  useEffect(() => {
    fetch(`/api/leagues/${league_id}`)
      .then(response => response.json())
      .then(json => setLeague(json.league as League))
      .catch(error => console.log)
  }, [])

  if (!league) return (
    <Layout>
      <Panel>
        Loading...
      </Panel>
    </Layout>
  )

  const { league_series, timezone } = league
  if (!league_series) return (
    <Layout>
      <Panel>
        `${league.name}` doesn&apos;t have a current series.
      </Panel>
    </Layout>
  )

  const { current_event, next_event, title } = league_series

  return (
    <Layout>
      <Panel>
        <TextBox darker lg cursive>{league.name}</TextBox>
        <Box my={16}>
          <TextBox lg>
            {league_series.title}
          </TextBox>
        </Box>
        {current_event ? (<EventInfo event={current_event} heading="Current" timezone={timezone} />) : <TextBox>No Current Events</TextBox>}
        {next_event ? (<EventInfo event={next_event} heading="Upcoming" timezone={timezone} />) : (<TextBox>No Upcoming Events</TextBox>)}
      </Panel>
    </Layout>
  )
}

export default LeagueLanding
