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

  render() {
    return(
      <ArticleShow
        id={this.state.article.id}
        title={this.state.article.title}
        body={this.state.article.body}
       />
    )
  }
}

export default ArticleShowContainer;
