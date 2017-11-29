import React, { Component } from 'react';
import accounting from 'accounting';

import SidebarTitle from '../SidebarTitle';

export default class BodyCorpSelector extends Component {

  STEP = 1000
  RANGE = [ 2000, 8000 ]

  renderNumericOptions() {
    // We add 1 to the rangeEnd in order to ensure the last entry 
    // is the value of rangeEnd...
    return _.map(_.range(this.RANGE[0], parseInt(this.RANGE[1]) + 1, this.STEP), value => {
      const option = (<option key={value} value={value}>&lt; {accounting.formatMoney(value, '$', 0)} ({this.getFacetCount(value)})</option>);
      return option;
    });
  }

  render() {
    return (
      <div className='sidebar__box'>
        <SidebarTitle value="Body Corp (Annual)" />
        <select value={this.initialValue()} id="max_body_corporate_fee" className='select' onChange={this.handleChange}>
          <option key='any' value=''>Any</option>
          {this.renderNumericOptions()}
        </select>
      </div>
    );
  }

  initialValue() {
    return _.get(this.props.filters, 'max_body_corporate_fee');
  }

  val() {
    return $("select#max_body_corporate_fee").val();
  }

  handleChange = () => {
    return this.props.actions.filterData({max_body_corporate_fee: this.val()});
  }

  getFacetCount = (value) => {
    if (!this.props.facets) { return 0; }
    let facets = this.props.facets;

    let pair = _.find(facets, pair => {
      const data = pair[0];
      return data == value;
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
