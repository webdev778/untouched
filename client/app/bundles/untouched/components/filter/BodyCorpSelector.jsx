import React, { Component } from 'react';
import accounting from 'accounting';

import SidebarTitle from '../SidebarTitle';

export default class BodyCorpSelector extends Component {

  STEP = 1000
  RANGE = [ 2000, 8000 ]

  renderNumericOptions() {
    // We add 1 to the rangeEnd in order to ensure the last entry 
    // is the value of rangeEnd...
    return _.map(_.range(this.RANGE[0], parseInt(this.RANGE[1]) + 1, this.STEP), value => (
      <option key={value} value={value}>&lt; {accounting.formatMoney(value, '$', 0)}</option>
    ));
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
}
