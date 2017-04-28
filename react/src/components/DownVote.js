import React from 'react';

const DownVote = (props) => {
  return(
    <div className="downvote" onClick={props.voteHandler}>
    <i className="fa fa-arrow-down" aria-hidden="true"></i>
    </div>
  )
}

export default DownVote;
