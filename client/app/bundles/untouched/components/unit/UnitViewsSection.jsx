import React, { Component } from 'react';

import ImageCard from '../ImageCard'

export default class UnitViewsSection extends Component {

  render() {
    return (
      <section className="scroll__section">
        <a name="views"></a>
        <div className="container">
          <div className="container__reset">
            {this.renderCards()}
          </div>
        </div>
      </section>
    );
  }

  renderCards() {
    return _.map(this.props.unit.views, view => (
      <ImageCard key={view.id} image={view} />
    ));
  }
}

