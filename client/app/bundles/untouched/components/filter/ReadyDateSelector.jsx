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
    return _.map(_.range(this.startYear(), this.endYear(), 0.25), function(value) {
      const year = Math.floor(value);
      const quarter = ((value - year) / 0.25) + 1;
      value = moment(new Date(`${year}-${(quarter*3)-2}-01`)).toJSON();
      return <option key={value} value={value}>&lt; {year} Q{quarter}</option>;
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
}
