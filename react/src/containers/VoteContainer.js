import 'babel-polyfill';
import React from 'react';
import ReactDOM from 'react-dom';
import UpVote from '../components/UpVote';
import DownVote from '../components/DownVote';


class VoteContainer extends React.Component {
  constructor(props){
    super(props)
    this.state = {
      reviews: [],
      comments: []
    };
    this.handleUpvote = this.handleUpvote.bind(this)
    this.handleDownvote = this.handleDownvote.bind(this)
  }

  componentDidMount() {

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

      return(
            <div>
            <UpVote
             handleUpvote={this.handleUpvote}
             />
            <DownVote
              handleDownvote={this.handleDownvote}
             />
         </div>
      )
    })
  }
}

export default VoteContainer;
