import React, { Component } from 'react';

import SidebarTitle from '../SidebarTitle';

export default class InternalM2Selector extends Component {

  STEP = 5
  RANGE = [ 40, 205 ]

  renderNumericOptions() {
    return _.map(_.range(...this.RANGE, this.STEP), value => (
      <option key={value} value={value}>&gt; {value}</option>
    ));
  }

  render() {
    return (
      <div className='sidebar__box'>
        <SidebarTitle value="Internal (M2)"/>
        <select id='internal_m2_selector' className='select' onChange={this.handleChange}>
          <option key='any' value=''>Any</option>
          {this.renderNumericOptions()}
        </select>
      </div>
    );
  }

  val() {
    return $('select#internal_m2_selector').val();
  }

  handleChange = () => {
    return DevelopmentActions.filterData({internal_in_meters: this.val()});
  }
}

