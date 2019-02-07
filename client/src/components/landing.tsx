import React, { useState, useEffect } from "react";
import Layout from "./layout"
import TextBox from "./style/textBox";

interface LeagueAttributes {
  id: number | string
  name: string
}
interface LeagueType {
  type: string
  id: number | string
  attributes: LeagueAttributes
  links: unknown
}

interface LeagueRouteProps {
  leagues: LeagueType[]
}

const LeagueRoutes = ({ leagues }: LeagueRouteProps) =>
  <ul>{
    leagues.map(league => {
      console.log({ league })
      return (<li key={league.id}>{league.attributes.name}</li>)
    })
  }</ul>


const Landing = () => {
  const [leagues, setLeagues] = useState([])

  useEffect(() => {
    fetch("/api/leagues")
      .then(response => response.json())
      .then(json => setLeagues(json.data))
      .catch(error => console.log(error))
  }, [])

  console.log({ leagues })

  return (
    <Layout>
      <TextBox base>
        {leagues && leagues.length > 0 ? <LeagueRoutes leagues={leagues} /> : "Loading..."}
      </TextBox>
    </Layout>
  )
}

export default Landing;
