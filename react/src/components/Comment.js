import React from 'react';

const Comment = (props) => {
  return(
    <div className="comment">
    <p>Comment body:{props.body}</p>
    </div>
  )
}

export default Comment;
