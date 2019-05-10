import React from 'react';
import {
  HashRouter as Router, 
  Route
} from 'react-router-dom';
import PostList from './components/PostList';
import NewPost from './components/NewPost';
import './App.css';

function App() {
  return (
    <Router>
      <div className="App">
        <Route exact path="/" component={PostList} />
        <Route exact path="/posts/new" component={NewPost} />
      </div>
    </Router>
  );
}

export default App;