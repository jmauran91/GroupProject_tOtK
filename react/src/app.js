import React from 'react';
import {ReactDOM, render} from 'react-dom';
import { Route, IndexRoute, Router, browserHistory } from 'react-router';
import ReviewContainer from './containers/ReviewContainer';
import ReleaseIndexContainer from './containers/ReleaseIndexContainer';

const App = (props) => {
  return(
    <Router history={browserHistory}>
      <Route path="/" component={ReleaseIndexContainer} />
      <Route path="releases/:id" component={ReviewContainer} />
    </Router>
  )
}

export default App;
