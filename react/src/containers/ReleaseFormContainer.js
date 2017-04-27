import React from 'react';
import TitleField from '../components/TitleField';
import ArtistField from '../components/ArtistField';
import PerformerField from '../components/PerformerField';
import YearField from '../components/YearField';
import StudioField from '../components/StudioField';
import NoTracksField from '../components/NoTracksField';
import AlbumArtField from '../components/AlbumArtField';
import DescriptionField from '../components/DescriptionField';

class ReleaseFormContainer extends React.Component {
  constructor(props){
    super(props)
    this.state = {
      releaseTitle: '',
      releaseArtist: '',
      releasePerformer: '',
      releaseYear: '',
      releaseStudio: '',
      releaseNoTracks: '',
      releaseAlbumArt: '',
      releaseDescription: ''

    }
    this.handleTitleFieldChange = this.handleTitleFieldChange.bind(this);
    this.handleArtistFieldChange = this.handleArtistFieldChange.bind(this);
    this.handlePerformerFieldChange = this.handlePerformerFieldChange.bind(this);
    this.handleYearFieldChange = this.handleYearFieldChange.bind(this);
    this.handleStudioFieldChange = this.handleStudioFieldChange.bind(this);
    this.handleNoTracksFieldChange = this.handleNoTracksFieldChange.bind(this);
    this.handleAlbumArtFieldChange = this.handleAlbumArtFieldChange.bind(this);
    this.handleDescriptionFieldChange = this.handleDescriptionFieldChange.bind(this);
    this.handleFormSubmit = this.handleFormSubmit.bind(this);
    this.handleFormClear = this.handleFormClear.bind(this);
  }

  handleTitleFieldChange(event) {
  this.setState({ releaseTitle: event.target.value });
  }

  handleArtistFieldChange(event) {
  this.setState({ releaseArtist: event.target.value });
  }

  handlePerformerFieldChange(event) {
  this.setState({ releasePerformer: event.target.value });
  }

  handleYearFieldChange(event) {
  this.setState({ releaseYear: event.target.value });
  }

  handleStudioFieldChange(event) {
  this.setState({ releaseStudio: event.target.value });
  }

  handleNoTracksFieldChange(event) {
  this.setState({ releaseNoTracks: event.target.value });
  }

  handleAlbumArtFieldChange(event) {
  this.setState({ releaseAlbumArt: event.target.value });
  }

  handleDescriptionFieldChange(event) {
  this.setState({ releaseDescription: event.target.value });
  }

  handleFormSubmit(event){
    event.preventDefault();
    let formPayload = {
      id: this.props.nextId,
      title: this.state.releaseTitle,
      artist: this.state.releaseArtist,
      performer: this.state.releasePerformer,
      year: this.state.releaseYear,
      studio: this.state.releaseStudio,
      no_of_tracks: this.state.releaseNoTracks,
      album_art_url: this.state.releaseAlbumArt,
      description: this.state.releaseDescription, 
    }
    console.log(formPayload)
    this.props.addNewRelease(formPayload)
    this.setState({
      releaseTitle: '',
      releaseArtist: '',
      releasePerformer: '',
      releaseYear: '',
      releaseStudio: '',
      releaseNoTracks: '',
      releaseAlbumArt: '',
      releaseDescription: ''
    });
  }

  handleFormClear(event){
    event.preventDefault();
    this.setState({
      releaseTitle: '',
      releaseArtist: '',
      releasePerformer: '',
      releaseYear: '',
      releaseStudio: '',
      releaseNoTracks: '',
      releaseAlbumArt: '',
      releaseDescription: ''
    });
  }
  render(){
    return(
      <form className="new-release-form callout" onSubmit={this.handleFormSubmit}>
        <TitleField
          content={this.state.releaseTitle}
          label="Release Title"
          name="release-title"
          handleChange={this.handleTitleFieldChange}
        />
        <ArtistField
          content={this.state.releaseArtist}
          label="Release Artist"
          name="release-artist"
          handleChange={this.handleArtistFieldChange}
        />
        <PerformerField
          content={this.state.releasePerformer}
          label="Release Performer"
          name="release-performer"
          handleChange={this.handlePerformerFieldChange}
        />
        <YearField
          content={this.state.releaseYear}
          label="Release Year"
          name="release-year"
          handleChange={this.handleYearFieldChange}
        />
        <StudioField
          content={this.state.releaseStudio}
          label="Release Studio"
          name="release-studio"
          handleChange={this.handleStudioFieldChange}
        />
        <NoTracksField
          content={this.state.releaseNoTracks}
          label="Release Tracks"
          name="release-tracks"
          handleChange={this.handleNoTracksFieldChange}
        />
        <AlbumArtField
          content={this.state.releaseAlbumArt}
          label="Release Album Art"
          name="release-album-art"
          handleChange={this.handleAlbumArtFieldChange}
        />
        <DescriptionField
          content={this.state.releaseDescription}
          label="Release Description"
          name="release-description"
          handleChange={this.handleDescriptionFieldChange}
        />
        <div className="button-group">
          <button className="button" onClick={this.handleFormClear}>Clear</button>
          <input className="button" type="submit" value="Submit" />
        </div>
      </form>
    )
  }
}

export default ReleaseFormContainer;
