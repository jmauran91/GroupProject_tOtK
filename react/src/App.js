import 'babel-polyfill';
import React from 'react';
import {ReactDOM, render} from 'react-dom';
import { Route, IndexRoute, Router, browserHistory } from 'react-router';
import ReleaseIndexContainer from './containers/ReleaseIndexContainer';
import ReviewContainer from './containers/ReviewContainer'

const App = (props) => {
  return(
    <Router history={browserHistory}>
    <Route path="/" component={ReleaseIndexContainer} />
    <Route path="/releases/:id" component={ReviewContainer} />
  </Router>

  )
}

export default App;
