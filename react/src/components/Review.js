import React from 'react';

const Review = (props) => {
  return(
    <div className="review">
    <div>Review body:{props.body}</div>
    <br />
    <div>Review rating:{props.rating}</div>
    <div>Review votes:{props.votes}</div>
    </div>
  )
}

export default Review;
