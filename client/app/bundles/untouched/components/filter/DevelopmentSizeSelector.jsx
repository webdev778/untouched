import React, { Component } from 'react';

import SidebarTitle from '../SidebarTitle';

export default class DevelopmentSizeSelector extends Component {

  OPTIONS = [ 20, 50, 100 ]

  renderOptions() {
    return _.map(this.OPTIONS, value => (<option key={value} value={value}>&lt; {value} residences ({this.getFacetCount(value)})</option>));
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

  getFacetCount = (value) => {
    if (!this.props.facets) { return 0; }
    let facets = this.props.facets;

    let pair = _.find(facets, pair => {
      const data = parseInt(pair[0]) 
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
