import React, { Component } from 'react';
import moment from 'moment'

export default class DevelopmentUnitsSoldProgressBar extends Component {

  render() {
    return (
      <div className="progress">
        <div className="bar">
          <div className="bar__stripe">
            <span data-percent={this.soldPercentage()} style={{width: this.soldPercentage() + '%'}}></span>
          </div>
          <div className="bar__text">
            {this.props.development.units_count} units: {this.soldPercentage()}% SOLD
          </div>
          <div className="bar__date">
            {this.formattedReadyDate()} completion
          </div>
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

  formattedReadyDate() {
    return moment(this.props.development.ready_at).format("MMMM YYYY");
  }
}

