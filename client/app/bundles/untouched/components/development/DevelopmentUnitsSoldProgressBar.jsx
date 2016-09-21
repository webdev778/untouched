import React, { Component } from 'react';

export default class DevelopmentUnitsSoldProgressBar extends Component {

  render() {
    return (
      <div className="progress">
        <div className="bar">
          <div className="bar__stripe">
            <span data-percent={this.soldPercentage()} style={{width: this.soldPercentage() + '%'}}></span>
          </div>
          <span className="bar__text">
            {this.soldPercentage()}% sold
          </span>
        </div>
      </div>
    );
  }

  soldPercentage() {
    return Math.round(
      (
        (this.props.development.units_count - this.props.development.units_active_count) / 
        this.props.development.units_count
      ) * 100
    );
  }
}

