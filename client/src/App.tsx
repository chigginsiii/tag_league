import React, { Component } from 'react';
import logo from './logo.svg';
import './App.css';
import Shell from './components/shell';
import Landing from './components/landing';

class App extends Component {
  componentDidMount() {
    fetch("/api/leagues")
      .then(response => response.json())
      .then(json => console.log(json))
      .catch(error => console.log(error))
  }

  render() {
    return (
      <Shell>
        <Landing />
      </Shell>
    )
  }
}

export default App;
