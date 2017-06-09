import ReactOnRails from 'react-on-rails';

import ReleaseIndexContainer from '../containers/ReleaseIndexContainer'
import ReviewContainer from '../containers/ReviewContainer'

// This is how react_on_rails can see the HelloWorld in the browser.
ReactOnRails.register({
  ReleaseIndexContainer,
  ReviewContainer
});
