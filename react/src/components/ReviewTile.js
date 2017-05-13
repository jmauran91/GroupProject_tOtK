import React, {Component} from 'react';
import Review from '../components/Review'
import CommentsContainer from '../containers/CommentsContainer'
import UpVote from '../components/UpVote'
import DownVote from '../components/DownVote'

class ReviewTile extends Component {
  constructor(props){
    super(props)
    this.state = {

    }
  }


  render(){


    return (
      <div>
        <Review
          key={this.props.id}
          id={this.props.id}
          rating={this.props.rating}
          body={this.props.body}
          votes={this.props.votes}
          />
        {/*<CommentsContainer
           />*/}
           <div className="upvote" onClick={this.props.upVoteHandler}>
           <i className="fa fa-arrow-up" aria-hidden="true"></i>
           </div>

           <div className="downvote" onClick={this.props.downVoteHandler}>
           <i className="fa fa-arrow-down" aria-hidden="true"></i>
           </div>

      </div>
    );

  }
};

export default ReviewTile;
