import React from 'react';

const DownVote = (props) => {
  return(
    <div className="downvote" onClick={props.handleVoteChangeNegative}>
    Downvote
    </div>
  )
}

export default DownVote;
