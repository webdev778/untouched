import React, { Component } from 'react';
import moment from 'moment';

import SidebarTitle from '../SidebarTitle';

export default class ReadyDateSelector extends Component {

  startYear() {
    return new Date().getFullYear();
  }

  endYear() {
    return this.startYear() + 5;
  }

  renderNumericOptions() {
    let valuePrev = 0;
    return _.map(_.range(this.startYear(), this.endYear(), 0.25), (value) => {
      const year = Math.floor(value);
      const quarter = ((value - year) / 0.25) + 1;
      value = moment(new Date(`${year}-${(quarter*3)-2}-01`)).toJSON();
      const option = (<option key={value} value={value}>&lt; {year} Q{quarter} ({this.getFacetCount(value, valuePrev)})</option>);
      valuePrev = value;
      return option;
    });
  }

  render() {
    return (
      <div className='sidebar__box'>
        <SidebarTitle value="Ready" />
        <select value={this.initialValue()} id="ready_date" className='select' onChange={this.handleChange}>
          <option key='any' value=''>Any ({this.getTotalFacetCount()})</option>
          {this.renderNumericOptions()}
        </select>
      </div>
    );
  }

  val() {
    return $("select#ready_date").val();
  }

  handleChange = () => {
    return this.props.actions.filterData({ready_at: this.val()});
  }

  initialValue() {
    return _.get(this.props.filters, 'ready_at');
  }

  getFacetCount = (value, valuePrev) => {
    if (!this.props.facets) { return 0; }
    let facets = this.props.facets;

    let pairs = _.filter(facets, pair => {
      const date = moment(pair[0]);
      return date < moment(value); // && date >= moment(valuePrev);
    });
    
    let count = pairs.reduce((prev, current) => {
      return prev + current[1];
    }, 0);
    if (!count) { return 0; }
    return count;
  }

  getTotalFacetCount() {
    if (!this.props.facets) { return 0; }
    let facets = this.props.facets;

    let count = facets.reduce((prev, current) => {
      return prev + current[1];
    }, 0);
    if (!count) { return 0; }
    return count;
  }
}
