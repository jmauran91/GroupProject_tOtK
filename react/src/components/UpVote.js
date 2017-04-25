import React from 'react';

const UpVote = (props) => {
  return(
    <div className="upvote" onClick={props.handleVoteChangePositive}>
    Upvote
    </div>
  )
}

export default UpVote;
