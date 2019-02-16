import React from 'react'
import { RouteComponentProps } from '@reach/router';
import Layout from '../layout';
import Panel from '../style/panel';
import TextBox from '../style/textBox';

const NotFound = (_props: RouteComponentProps) =>
  <Layout>
    <Panel>
      <TextBox>
        Not Found!
      </TextBox>
    </Panel>
  </Layout>

export default NotFound
