import React from 'react';
import logo from './logo.svg';
import './App.css';

class UserList extends React.Component {
  state = { users: [] }

  componentDidMount = () => {
    fetch('/api/users')
      .then(res=>res.json())
      .then(res=>this.setState({users:res}))
  }

  render() {
    return(
      <>
        <p>{this.state.users.length} users have been fetched from server</p>
        <h2>They are ...</h2>
        {this.state.users.map(user => user.name).join(', ')}
      </>
    )
  }
}

function App() {
  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        <UserList />
        <p>
          Edit <code>src/App.js</code> and save to reload.
        </p>
        <a
          className="App-link"
          href="https://reactjs.org"
          target="_blank"
          rel="noopener noreferrer"
        >
          Learn React
        </a>
      </header>
    </div>
  );
}

export default App;
