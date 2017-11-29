import React, { Component } from 'react';

export default class VideoCard extends Component {

  render() {
    return (
      <div key={this.props.video.id} className="card">
        <div className="iframe" dangerouslySetInnerHTML={{__html: this.props.video.iframe}} />
        {this.renderCaption()}
      </div>
    );
  }

  renderCaption() {
    if (this.props.video.caption) {
      return <h4 className="card__caption" dangerouslySetInnerHTML={{__html: this.props.video.caption_html}} />;
    }
  }
}

