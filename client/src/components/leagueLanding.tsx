import React, { useEffect, useState } from 'react'
import { RouteComponentProps } from '@reach/router';
import TextBox from './style/textBox';
import Layout from './layout';
import Panel from './style/panel';
import { League } from '../types/league';

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

  return (
    <Layout>
      <Panel>
        <TextBox darker lg>{league.name}</TextBox>
        {league.league_series && league.league_series.current_event && (
          <div>
            <TextBox>
              current event: {league.league_series.current_event.title}
            </TextBox>
            {league.league_series.current_event.event_rounds.map(r =>
              <TextBox key={r.round_num}>
                Round {r.round_num} at: {r.course}
              </TextBox>
            )}
            <TextBox>
              Starts at: {league.league_series.current_event.event_start_time}
            </TextBox>
            <TextBox>
              Ends at: {league.league_series.current_event.event_end_time}
            </TextBox>
          </div>
        )}
        {league.league_series && league.league_series.next_event && (
          <TextBox>
            next event: {league.league_series.next_event.title}
          </TextBox>
        )}
      </Panel>
    </Layout>
  )
}

export default LeagueLanding
