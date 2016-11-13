import React, { Component } from 'react';

import ImageCard from '../ImageCard'

export default class UnitPlansSection extends Component {

  render() {
    return (
      <section className="scroll__section scroll__plans">
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
    return _.map(this.props.unit.plans, plan => (
      <ImageCard key={plan.id} image={plan} />
    ));
  }
}
