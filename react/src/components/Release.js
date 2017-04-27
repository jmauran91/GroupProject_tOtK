import React from 'react';

const Release = (props) => {
  return(
    <div className="column column-block release-tile">
      <a href={'/releases/' + props.id}>
        <img src={props.album_art_url} height="500" width="500"/>
      </a>
      <div className="release-label">
        <a href={'/releases/' + props.id}>{props.title}</a> - <p>{props.artist}</p>
      </div>
    </div>
  )
}

export default Release;
