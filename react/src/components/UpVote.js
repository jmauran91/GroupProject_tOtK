import React from 'react';

const UpVote = (props) => {
  return(
    <div className="upvote" onClick={props.voteHandler}>
    <i className="fa fa-arrow-up" aria-hidden="true"></i>
    </div>
  )
}

export default UpVote;
