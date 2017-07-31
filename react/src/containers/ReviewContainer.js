import React, {Component} from 'react';
import Review from '../components/Review';
import UpVote from '../components/UpVote'
import DownVote from '../components/DownVote'

class ReviewContainer extends Component {
  constructor(props){
    super(props)
    this.state = {
      reviews: [],
      showme: false
    }
    this.handleVoteChangePositive = this.handleVoteChangePositive.bind(this)
    this.handleVoteChangeNegative = this.handleVoteChangeNegative.bind(this)
  }

  componentDidMount() {
    let id = this.props.params.id
    fetch(`/api/v1/releases/${id}/reviews`)
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
        this.setState({ reviews: response  });
      })
  }


  render(){

      let reviews = this.state.reviews.map(review => {
              let upVoteChangeHandler = () => {
                this.handleVoteChangePositive(review.id, true)
              }
              let downVoteChangeHandler = () => {
                this.handleVoteChangeNegative(review.id, true)
              }
        return(
          <div className="review">
            <div className="votes">
            <UpVote
              upVoteHandler={upVoteChangeHandler}
              />
            <h4 className="num-votes">{review.votes}</h4>
            <DownVote
              downVoteHandler={downVoteChangeHandler}
              />
          </div>
          <Review
          key={review.id}
          id={review.id}
          releaseId={this.props.params.id}
          rating={review.rating}
          body={review.body}
          votes={review.votes}
          />

      </div>
        )
      })
    return (
      <div>
        {reviews}
      </div>
    );

  }
};

export default ReviewContainer;
