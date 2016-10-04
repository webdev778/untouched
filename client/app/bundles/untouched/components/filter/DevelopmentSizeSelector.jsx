import React, { Component } from 'react';

import SidebarTitle from '../SidebarTitle';

export default class DevelopmentSizeSelector extends Component {

  OPTIONS = [ 20, 50, 100 ]

  renderOptions() {
    return _.map(this.OPTIONS, value => ( 
      <option key={value} value={value}>&lt; {value} residences</option>
    ));
  }

  render() {
    return (
      <div className='sidebar__box'>
        <SidebarTitle value="Development Size" />
        <select value={this.initialValue()} id="development_size" className='select' onChange={this.handleChange}>
          <option value="">Any</option>
          {this.renderOptions()}
        </select>
      </div>
    );
  }

  initialValue() {
    return _.get(this.props.filters, 'units_count');
  }

  val() {
    return $("select#development_size").val();
  }

  handleChange = () => {
    return this.props.actions.filterData({units_count: this.val()});
  }
}
