import React, { Component } from 'react';

import TipActions from '../../actions/tip_actions';

import ImageCard from '../ImageCard';

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
      <section className="scroll__section">
        <div className="container">
          <div className="container__reset" ref={c => this.overview = c}>
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
}

