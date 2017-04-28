import React, {Component} from 'react';
import ReviewTile from '../components/ReviewTile'
class ReviewContainer extends Component {
  constructor(props){
    super(props)
    this.state = {
      reviews: []
    }
    this.handleVoteChangePositive = this.handleVoteChangePositive.bind(this)
    this.handleVoteChangeNegative = this.handleVoteChangeNegative.bind(this)

  }

  componentDidMount() {
    let releaseId = this.props.params.id;

    fetch(`/api/v1/releases/${releaseId}/reviews`)
      .then(response => response.json())
      .then(responseData => {
        this.setState({ reviews: responseData })
      })
  }


  handleVoteChangePositive(reviewId, boolpos){
    let payloadPos = {
      review_id: reviewId,
      upvote: boolpos,
      downvote: !boolpos
    }
    fetch(`/api/v1/reviews/${reviewId}`, {
      credentials: 'same-origin',
      method: 'PUT',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify(payloadPos)
    })
      .then(response => {
        if (response.ok) {
          return response;
        } else {
          let errorMessage = `${response.status} (${response.statusText})`,
              error = new Error(errorMessage);
          throw(error);
        }
      })
      .then(response => response.json())
      .then(response => {
        console.log(response)
        this.setState({ reviews: response });
      })
  }
  handleVoteChangeNegative(reviewId, boolneg){
    let payloadNeg = {
      review_id: reviewId,
      downvote: boolneg,
      upvote: !boolneg
    }
    fetch(`/api/v1/reviews/${reviewId}`, {
      credentials: 'same-origin',
      method: 'PUT',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify(payloadNeg)
    })
      .then(response => {
        if (response.ok) {
          return response;
        } else {
          let errorMessage = `${response.status} (${response.statusText})`,
              error = new Error(errorMessage);
          throw(error);
        }
      })
      .then(response => response.json())
      .then(response => {
        console.log(response)
        this.setState({ review: response  });
      })
  }


  render(){

      let reviewTiles = this.state.reviews.map(review => {

      let upVoteChangeHandler = () => {
        this.handleVoteChangePositive(review.id, true)
      }
      let downVoteChangeHandler = () => {
        this.handleVoteChangeNegative(review.id, true)
      }

        return(
          <ReviewTile
          key={review.id}
          id={review.id}
          rating={review.rating}
          body={review.body}
          votes={review.votes}
          upVoteHandler ={this.upVoteChangeHandler}
          downVoteHandler = {this.downVoteChangeHandler}
          />
        )
      })
    return (
      <div>
        {reviewTiles}
      </div>
    );

  }
};

export default ReviewContainer;
