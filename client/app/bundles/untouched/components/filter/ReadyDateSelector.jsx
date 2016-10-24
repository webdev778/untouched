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
    return _.map(_.range(this.startYear(), this.endYear(), 0.25), (value) => {
      const year = Math.floor(value);
      const quarter = ((value - year) / 0.25) + 1;
      value = moment(new Date(`${year}-${(quarter*3)-2}-01`)).toJSON();
      const option = (<option key={value} value={value}>&lt; {year} Q{quarter} ({this.getFacetCount(value)})</option>);
      return option;
    });
  }

  render() {
    return (
      <div className='sidebar__box'>
        <SidebarTitle value="Ready" />
        <select value={this.initialValue()} id="ready_date" className='select' onChange={this.handleChange}>
          <option key='any' value=''>Any</option>
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

  getFacetCount = (value) => {
    if (!this.props.facets) { return 0; }
    let facets = this.props.facets;

    let pair = _.find(facets, pair => {
      const data = moment(new Date(pair[0]));
      return data.isSame(value, 'day');
    });

    let count = _.get(pair, [1]);
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
