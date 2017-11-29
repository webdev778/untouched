import React, { Component } from 'react';

export default class VisitsCount extends Component {

  static defaultProps = {
    count: 0
  }

  render() {
    return (
      <section className="scroll__section scroll__visits">
        <div className="container">
          <div className="container__reset">
            <div className="visits-count">
              {this.props.count} views <span className="visits-count__period">(Last 7 days)</span>
            </div>
          </div>
        </div>
      </section>
    );
  }
}


