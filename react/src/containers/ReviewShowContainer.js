import React, { Component } from 'react';
import ArticleShow from '../components/ArticleShow';

class ArticleShowContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {
      article: {}
    }
  }

  componentDidMount() {
    let articleId = this.props.params.id;
    fetch(`/api/v1/articles/${articleId}`)
      .then(response => response.json())
      .then(responseData => {
        this.setState({ article: responseData })
      })
  }
  /* Handle upvote and downvote are gonna be fetch requests*/

  render() {
      let comments;
    return(
      <VoteContainer />
      {comments}
  }
}

export default ArticleShowContainer;
