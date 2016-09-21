import React, { Component } from 'react';

import SidebarTitle from '../SidebarTitle';

export default class M2Selector extends Component {

  renderNumericOptions() {
    // We add 1 to the rangeEnd in order to ensure the last entry 
    // is the value of rangeEnd...
    return _.map(
      _.range(this.props.rangeStart, parseInt(this.props.rangeEnd) + 1, this.props.step), value => (
        <option key={value} value={value}>&gt; {value}</option>
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
}

