import React, { Component } from 'react';

import SidebarTitle from '../SidebarTitle';

export default class M2Selector extends Component {

  renderNumericOptions() {
    // We add 1 to the rangeEnd in order to ensure the last entry 
    // is the value of rangeEnd...
    return _.map(
      _.range(this.props.rangeStart, parseInt(this.props.rangeEnd) + 1, this.props.step), value => (
        <option key={value} value={value}>&gt; {value} ({this.getFacetCount(value, +value + +this.props.step, this.props.rangeEnd)})</option>
      )
    );
  }

  initialVal() {
    return this.props.filters[this.props.paramName];
  }

  render() {
    return (
      <div className='sidebar__box'>
        <SidebarTitle value={this.props.label + ' (M2)'}/>
        <select value={this.initialVal()} id={this.props.id} className='select' onChange={this.handleChange}>
          <option key='any' value=''>Any ({this.getTotalFacetCount()})</option>
          {this.renderNumericOptions()}
        </select>
      </div>
    );
  }

  val() {
    return $(`select#${this.props.id}`).val();
  }

  handleChange = () => {
    let params = {};
    params[this.props.paramName] = this.val();
    return this.props.actions.filterData(params);
  }

  getFacetCount = (value, valueNext, valueMax) => {
    if (!this.props.facets) { return 0; }
    let facets = this.props.facets;

    let pairs = _.filter(facets, pair => {
      const data = parseInt(pair[0]) 
      return data > value; // && (value > valueMax ? true : data <= valueNext);
    });

    let count = pairs.reduce((prev, current) => {
      return prev + current[1]
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

