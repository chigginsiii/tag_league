import React, { useEffect, useState } from 'react'
import { RouteComponentProps } from '@reach/router'
import { League, EventRound, SeriesEvent } from '../../types/league'
import TextBox from '../style/textBox'
import Panel from '../style/panel'
import Layout from '../layout'
import Box from '../style/box';

const CurrentEvent = ({ currentEvent }: { currentEvent: SeriesEvent }) =>
  <>
    <TextBox>
      current event: {currentEvent.title}
    </TextBox>
    {currentEvent.event_rounds.map((r: EventRound) =>
      <TextBox key={r.round_num}>
        Round {r.round_num} at: {r.course}
      </TextBox>
    )}
    <TextBox>
      Starts at: {currentEvent.event_start_time}
    </TextBox>
    <TextBox>
      Ends at: {currentEvent.event_end_time}
    </TextBox>
  </>


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

  const { league_series } = league
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
        {current_event ? (<CurrentEvent currentEvent={current_event} />) : <TextBox>No Current Events</TextBox>}
        {next_event ? (<TextBox>next event: {next_event.title}</TextBox>) : (<TextBox>No Upcoming Events</TextBox>)}
      </Panel>
    </Layout>
  )
}

export default LeagueLanding
