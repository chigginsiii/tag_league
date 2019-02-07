import React from 'react'
import { RouteComponentProps } from '@reach/router';
import TextBox from './style/textBox';
import Layout from './layout';

interface LeagueLandingProps extends RouteComponentProps { }
const LeagueLanding = ({ }: LeagueLandingProps) =>
  <Layout>
    <TextBox darker>LEAGUE LANDING</TextBox>
  </Layout>

export default LeagueLanding
