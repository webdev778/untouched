import React, { Component } from 'react';

import SidebarTitle from '../SidebarTitle';

export default class CeilingHeightSelector extends Component {

  STEP = 0.1
  RANGE = [ 2.4, 4 ]

  renderNumericOptions() {
    return _.map(_.range(this.RANGE[0], parseInt(this.RANGE[1]) + 0.1, this.STEP), function(value) {
      value = value.toFixed(1);
      return <option key={value} value={value}>&gt; {value}m</option>;
    });
  }

  render() {
    return (
      <div className='sidebar__box'>
        <SidebarTitle value="Ceiling Height (Living Area)" />
        <select value={this.initialValue()} id="ceiling_height" className='select' onChange={this.handleChange}>
          {this.renderNumericOptions()}
        </select>
      </div>
    );
  }

  initialValue() {
    return __guard__(this.props.filters, x => x.ceiling_height_at_living_area_in_meters);
  }

  val() {
    return $("select#ceiling_height").val();
  }

  handleChange = () => {
    return this.props.actions.filterData({ceiling_height_at_living_area_in_meters: this.val()});
  }
}


function __guard__(value, transform) {
  return (typeof value !== 'undefined' && value !== null) ? transform(value) : undefined;
}