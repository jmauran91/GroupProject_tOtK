import React from 'react';

const Review = (props) => {
  return(
    <div className="review-text">
    <h5>Review rating: {props.rating}</h5>
    <h5>Review body: {props.body}</h5>
    <a href={'/releases/' + props.releaseId + '/reviews/' + props.id + '/edit'}>Edit this review</a>
    <br />
    </div>
  )
}

export default Review;
