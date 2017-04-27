import 'babel-polyfill';
import React from 'react';
import ReactDOM from 'react-dom';
import UpVote from '../components/UpVote';
import DownVote from '../components/DownVote';
import Review from '../components/Review';
import Comment from '../components/Comment';

class VoteContainer extends React.Component {
  constructor(props){
    super(props)
    this.state = {
      reviews: [],
      comments: []
    };
    this.handleVoteChangePositive = this.handleVoteChangePositive.bind(this)
    this.handleVoteChangeNegative = this.handleVoteChangeNegative.bind(this)
  }

  componentDidMount() {
  let releaseId = this.props.params.id;
  fetch(`/api/v1/releases/${releaseId}`)
    .then(response => response.json())
    .then(responseData => {
      this.setState({ reviews: responseData })
    })
  fetch(`/api/v1/comments`)
    .then(response => response.json())
    .then(responseData => {
      this.setState({ comments: responseData })
    })
  }

  // componentDidMount() {
  // fetch(`/api/v1/comments`)
  //   .then(response => response.json())
  //   .then(responseData => {
  //     this.setState({ comments: responseData })
  //   })
  // }

  handleVoteChangePositive(reviewObj, boolpos){
    let payloadPos = {
      review_id: reviewObj.id,
      upvote: boolpos,
      downvote: !boolpos
    }
    fetch(`/api/v1/reviews/${reviewObj.id}`, {
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
        return response
      })
  }

  handleVoteChangeNegative(reviewObj, boolneg){
    let payloadNeg = {
      review_id: reviewObj.id,
      downvote: boolneg,
      upvote: !boolneg
    }
    fetch(`/api/v1/reviews/${reviewObj.id}`, {
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
        this.setState({ reviews: response  });
        return response
      })
  }

  render() {
    let pageRender = this.state.reviews.map(review => {
      let functVoteChangePositive = () => {
        this.handleVoteChangePositive(review, true)
      }
      let functVoteChangeNegative = () => {
        this.handleVoteChangeNegative(review, true)
      }
      return(
        <div className="column large-6">
          <div className="">
          <div>
          <Review
           key={review.id}
           body={review.body}
           rating={review.rating}
           votes={review.votes}
           user_id={review.user_id}
           release_id={review.release_id}
           />
           </div>
          <div className="voting">
            <UpVote
             className="button"
             voteChangePositive={functVoteChangePositive}
             />
            <DownVote
             className="button"
             voteChangeNegative={functVoteChangeNegative}
             />
             <br />
             <br />
           </div>
          </div>
        </div>
      )
    })
    {/*}// let commentRender = this.state.comments.map(comment => {
    //     <div>
    //     <Comment
    //     key={comment.id}
    //     body={comment.body}
    //     review_id={comment.review_id}
    //     user_id={comment.user_id}
    //     />
    //     </div>
    // }) */}
    return(
      <div>
      {pageRender}
      {/* {commentRender} */}
      </div>
    );
  }
}

export default VoteContainer;
