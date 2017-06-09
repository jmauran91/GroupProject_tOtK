import React from 'react';

const UpVote = (props) => {
  return(
    <div className="upvote" onClick={props.upVoteHandler}>
    <i className="fa fa-arrow-up fa-2x" aria-hidden="true"></i>
    </div>
  )
}

export default UpVote;
