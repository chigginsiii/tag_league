import React, { useState, useEffect } from "react";
import Layout from "./layout"
import TextBox from "./style/textBox";
import { RouteComponentProps, Link } from "@reach/router";

interface LeagueAttributes {
  id: number | string
  name: string
}
interface LeagueType {
  type: string
  id: number | string
  attributes: LeagueAttributes
  links: any
}

interface LeagueRouteProps {
  leagues: LeagueType[]
}

const LeagueSelect = ({ leagues }: LeagueRouteProps) =>
  <ul>{
    leagues.map(league => {
      console.log({ league })
      return (
        <li key={league.id}>
          <Link to={`/leagues/${league.id}`}>
            {league.attributes.name}
          </Link>
        </li>
      )
    })
  }</ul>

interface LandingProps extends RouteComponentProps { }

const Landing = ({ }: LandingProps) => {
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
        {leagues && leagues.length > 0 ? <LeagueSelect leagues={leagues} /> : "Loading..."}
      </TextBox>
    </Layout>
  )
}

export default Landing;
