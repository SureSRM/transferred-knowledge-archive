import React, { Component } from 'react';
import logo from './logo.svg';
import './App.css';

import SearchBoxContainerUnsafe from "./container/SearchBoxContainerUnsafe";
import SearchBoxContainerSafe1 from "./container/SearchBoxContainerSafe1";
import SearchBoxContainerSafe2 from "./container/SearchBoxContainerSafe2";

class App extends Component {
  render() {
    return (
      <div className="App">
          <div>
              <h1>Search Box Unsafe</h1>
              <SearchBoxContainerUnsafe/>
          </div>
          <div>
              <h1>Search Box Safe 1</h1>
              <SearchBoxContainerSafe1/>
          </div>
          <div>
              <h1>Search Box Safe 2</h1>
              <SearchBoxContainerSafe2/>
          </div>
      </div>
    );
  }
}

export default App;
