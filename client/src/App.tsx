import React, { Component } from 'react';
import logo from './logo.svg';
import './App.css';
import { Router } from '@reach/router'
import Shell from './components/shell';

import Landing from './components/pages/landing';
import LeagueLanding from './components/pages/leagueLanding';
import styled from '@emotion/styled';

const RouterDiv = styled.div({ flexGrow: 1, height: '100%' })
const App = () =>
  <Shell>
    <Router component={RouterDiv}>
      <Landing path="/" />
      <LeagueLanding path="/leagues/:league_id" />
    </Router>
  </Shell>

export default App;
