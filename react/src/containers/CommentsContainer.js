import CommentsContainer, {Component} from 'react';
import Comment from '../components/Comment'

class Name extends Component {
  constructor(props){
    super(props)

  }


  render(){
      let comment_list;
      comment_list = this.props.comments.map(comment => {
        return(
          <Comment
            key={article.id}
            id={article.id}
            body={article.body}
          />
        )
      })
    return (
      <div>
      {comment_list}
    </div>
    );

  }
};

export default CommentsContainer;
