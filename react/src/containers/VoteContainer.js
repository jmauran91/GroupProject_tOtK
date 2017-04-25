import 'babel-polyfill';
import React from 'react';
import ReactDOM from 'react-dom';
import UpVote from '../components/UpVote';
import DownVote from '../components/DownVote';


class VoteContainer extends React.Component {
  constructor(props){
    super(props)
    this.state = {
      review: {}

    }
    this.handleVoteChangePositive = this.handleVoteChangePositive.bind(this)
    this.handleVoteChangeNegative = this.handleVoteChangeNegative.bind(this)
  }

  componentDidMount() {
  let reviewId = this.props.params.id;
  fetch(`/api/v1/reviews/${reviewId}`)
    .then(response => response.json())
    .then(responseData => {
      this.setState({ review: responseData })
    })
}


  handleVoteChangePositive(){
    let reviewId = this.props.params.id
    let payloadPos = { votes: (this.state.review.votes + 1) }
    fetch(`/api/v1/reviews/${reviewId}`, {
      credentials: 'same-origin',
      method: 'PATCH',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify(payloadPos)
    })
      .then(response => response.json())
      .then(response => {
        console.log(response);
        this.setState({ review: response })}
      )
  }

  handleVoteChangeNegative(){
    let reviewId = this.props.params.id
    let payloadNeg = { votes: (this.state.review.votes - 1) }
    fetch(`/api/v1/reviews/${reviewId}`, {
      credentials: 'same-origin',
      method: 'PATCH',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify(payloadNeg)
    })
      .then(response => response.json())
      .then(response => {
        console.log(response);
        this.setState({ review: response }) }
      )
  }

  render() {
    return(
      <div className="row large-6">
      Review points: {this.state.review.votes}
      <UpVote
       className="button"
       handleVoteChangePositive={this.handleVoteChangePositive}
       />
      <DownVote
       className="button"
       handleVoteChangeNegative={this.handleVoteChangeNegative}
       />
       </div>
    )
  }
}

export default VoteContainer;
