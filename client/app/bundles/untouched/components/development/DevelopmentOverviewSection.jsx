import React, { Component } from 'react';

import TipActions from '../../actions/tip_actions';

import ImageCard from '../ImageCard';
import VideoCard from '../VideoCard';

export default class DevelopmentOverviewSection extends Component {

  imagesLoaded(parentNode) {
    let imgElements = parentNode.querySelectorAll('img');

    for (let i = 0; i < imgElements.length; i++) {
      let img = imgElements[i];
      if (!img.complete) {
        return false;
      }
    }

    return true;
  }

  handleStateChange = () => {
    let overviewElement = this.overview;
    if (this.imagesLoaded(overviewElement)) {
      TipActions.overviewLoaded(true);
    }
  }

  render() {
    return (
      <section className="scroll__section scroll__overview">
        <div>
          <div className="container__reset" ref={c => this.overview = c}>
            {this.renderVideos()}
            {this.renderPhotos()}
          </div>
        </div>
      </section>
    );
  }

  renderPhotos() {
    if (!this.props.development) { return; }
    return _.map(this.props.development.photos, photo => (
      <ImageCard
        key={photo.id}
        image={photo}
        handleImageLoaded={this.handleStateChange}
        handleImageErrored={this.handleStateChange} />
    ));
  }

  renderVideos() {
    if (!this.props.development) { return; }
    return _.map(this.props.development.videos, video => (
      <VideoCard
        key={video.id}
        video={video}
      />
    ));
  }
}

