import React, { Component } from 'react';
import LazySizes from 'react-lazysizes';

export default class ImageCard extends Component {

  static defaultProps = {
    handleImageLoaded: () => {},
    handleImageErrored: () =>  {}
  }

  render() {
    return (
      <div key={this.props.image.id} className="card">
        <LazySizes dataSrc={this.props.image.url}/>
        {this.renderCaption()}
      </div>
    );
  }

  renderCaption() {
    if (this.props.image.caption) {
      return <h4 className="card__caption" dangerouslySetInnerHTML={{__html: this.props.image.caption_html}} />;
    }
  }
}

