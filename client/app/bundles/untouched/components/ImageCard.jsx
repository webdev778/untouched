import React, { Component } from 'react';

export default class ImageCard extends Component {

  static defaultProps = {
    handleImageLoaded: () => {},
    handleImageErrored: () =>  {}
  }

  render() {
    return (
      <div key={this.props.image.id} className="card">
        <img src={this.props.image.url} onLoad={this.props.handleImageLoaded} onError={this.props.handleImageErrored}/>
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

