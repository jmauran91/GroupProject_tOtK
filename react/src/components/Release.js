import React from 'react';

const Release = (props) => {
  return(
    <div className="review">
    <p>Release title:{props.title}</p>
    <p>Review artist:{props.artist}</p>
    <p>Review performer:{props.performer}</p>
    <p>Review year:{props.year}</p>
    <p>Review studio:{props.studio}</p>
    <p>Review tracks:{props.no_of_tracks}</p>
    <p>Review art:{props.album_art_url}</p>
    <p>Review description:{props.description}</p>
    </div>
  )
}

export default Release;
