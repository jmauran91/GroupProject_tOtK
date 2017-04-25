import 'babel-polyfill';
import React from 'react';
import {ReactDOM, render} from 'react-dom';
import { Route, IndexRoute, Router, browserHistory } from 'react-router';
import VoteContainer from './containers/VoteContainer';

const App = (props) => {
  return(
    <Router history={browserHistory}>
      <Route path="/releases/:id" component={VoteContainer} />
    </Router>
  )
}

export default App;
