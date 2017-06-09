import React from 'react';
import Release from '../components/Release';

class ReleaseIndexContainer extends React.Component {
  constructor(props){
    super(props);
    this.state = {
      releases: []
    }
  }

  componentDidMount(){
    fetch(`api/v1/releases`)
      .then(response => response.json())
      .then(response => {
        this.setState({ releases: response })
      })
  }


  render(){
    let renderReleases = this.state.releases.map(release => {
      return(
        <Release
        key={release.id}
        id={release.id}
        title={release.title}
        artist={release.artist}
        performer={release.performer}
        year={release.year}
        studio={release.studio}
        no_of_tracks={release.no_of_tracks}
        album_art_url={release.album_art_url}
        description={release.description}
        />
      )
    })
    return(
      <div>
      <div className="row small-up-1 medium-up-2 large-up-3">
        {renderReleases}
      </div>
    </div>
    )
  }
}

export default ReleaseIndexContainer;
