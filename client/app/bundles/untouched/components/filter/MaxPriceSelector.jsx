import React, { Component } from 'react';
import accounting from 'accounting';

import SidebarTitle from '../SidebarTitle';

export default class MaxPriceSelector extends Component {

  /*
    Any
    $400,000
    $450,000
    $500,000
    $550,000
    $600,000
    $650,000
    $700,000
    $750,000
    $800,000

    $900,000
    $1,000,000
    $1,100,000
    $1,200,000
    $1,300,000
    $1,400,000
    $1,500,000
    
    $2,000,000
    $2,500,000
    $3,000,000
  */
  renderNumericOptions() {
    let valuePrev = 0;
    let value = 400000;
    const options = [];

    _.times(19, (index) => {
      options.push(<option key={index} value={value}>&lt; {accounting.formatMoney(value, '$', 0)} ({this.getFacetCount(value, valuePrev)})</option>);

      valuePrev = value;
      if (value < 800000) {
        value += 50000;
      } else if (value < 1500000) {
        value += 100000;
      } else if (value < 3000000) {
        value += 500000;
      }
    });

    return options;
  }

  render() {
    return (
      <div className='sidebar__box'>
        <h4 className='sidebar__title'>Max Price</h4>
        <select defaultValue={this.props.filters.max_price} id='max_price_selector' className='select' onChange={this.handleChange}>
          <option key='any' value=''>Any ({this.getTotalFacetCount()})</option>
          {this.renderNumericOptions()}
        </select>
      </div>
    );
  }

  val() {
    return $('select#max_price_selector').val();
  }

  handleChange = () => {
    return this.props.actions.filterData({max_price: this.val()});
  }

  getFacetCount = (value, valuePrev) => {
    if (!this.props.facets) { return 0; }
    let facets = this.props.facets;

    let pairs = _.filter(facets, pair => {
      const price = parseInt(pair[0]) 
      return price <= value && price > valuePrev;
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

