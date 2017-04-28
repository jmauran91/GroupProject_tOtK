import React, {Component} from 'react';

class ReviewTile extends Component {
  constructor(props){
    super(props)
    this.state = {
      comments: []
    }
  }

  componentDidMount() {
    fetch(`/api/v1/${this.props.reviewId}/comments`)
      .then(response => response.json())
      .then(responseData => {
        this.setState({ comments: responseData })
      })
  }
  render(){
    return (
      <VoteContainer
        reviewId={this.props.reviewId}/>
    );

  }
};

export default ReviewTile;
