import React, { useState, useEffect } from "react";
import logo from "./logo.svg";
import "./App.css";

import { API_HOST } from "./config";

function App() {
  const [msg, setMsg] = useState("Loading...");

  useEffect(() => {
    fetch(`${API_HOST}/api/hello/?name=World`)
      .then((result) => result.json())
      .then(({ message }) => setMsg(message))
      .catch(() => setMsg("Cannot connect to server!"));
  }, []);

  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        <p>{msg}</p>
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
