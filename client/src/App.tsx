import React, { Component } from 'react';
import logo from './logo.svg';
import './App.css';
import Shell from './components/shell';
import Landing from './components/landing';

const App = () =>
  <Shell>
    <Landing />
  </Shell>

export default App;
