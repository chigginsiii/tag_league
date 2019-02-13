import React, { useEffect, useState } from 'react'
import { RouteComponentProps } from '@reach/router';
import TextBox from './style/textBox';
import Layout from './layout';

interface LeagueLandingProps extends RouteComponentProps<{ league_id: string }> { }

const LeagueLanding = ({ league_id }: LeagueLandingProps) => {
  const [events, setEvents] = useState([])

  useEffect(() => {
    fetch(`/api/leagues/${league_id}`)
      .then(response => response.json())
      .then(json => setEvents(json.data))
      .catch(error => console.log)
  }, [])

  return (<Layout>
    <TextBox darker>LEAGUE LANDING</TextBox>
  </Layout>
  )
}

export default LeagueLanding
