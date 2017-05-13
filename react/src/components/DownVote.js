import React from 'react';

const DownVote = (props) => {
  return(
    <div className="downvote" onClick={props.downVoteHandler}>
    <i className="fa fa-arrow-down fa-2x" aria-hidden="true"></i>
    </div>
  )
}

export default DownVote;
