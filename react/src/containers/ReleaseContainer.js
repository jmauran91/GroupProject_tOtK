import React, {Component} from 'react';

class ReleaseContainer extends Component {
  constructor(props){
    super(props)
    this.state = {
      reviews: []
    }
  }

  componentDidMount() {
    let releaseId = this.props.params.id;
    fetch(`/api/v1/release/${releaseId}/reviews`)
      .then(response => response.json())
      .then(responseData => {
        this.setState({ reviews: responseData })
      })
  }
  render(){
      let reviews;
          <ReviewTile
            reviewId={review.id} />
    return (
      {reviews}
    );

  }
};

export default ReleaseContainer;
