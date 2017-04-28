
import React from 'react';
import {ReactDOM, render} from 'react-dom';
import { Route, IndexRoute, Router, browserHistory } from 'react-router';
import ReleaseIndexContainer from './containers/ReleaseIndexContainer';

const App = (props) => {
  return(
    <Router history={browserHistory}>
    <Route path="/" component={ReleaseIndexContainer} />
  </Router>

  )
}

export default App;
