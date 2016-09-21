import React, { Component } from 'react';
import accounting from 'accounting';

import SidebarTitle from '../SidebarTitle';

export default class MaxPriceSelector extends Component {

  RANGE_IN_HUNDRED_THOUSANDS = [ 4, 20 ]

  renderNumericOptions() {
    return _.map(_.range(...this.RANGE_IN_HUNDRED_THOUSANDS), function(hundoThousands) {
      const value = hundoThousands * 100000;
      return <option key={hundoThousands} value={value}>{accounting.formatMoney(value, '$', 0)}</option>;
    });
  }

  render() {
    return (
      <div className='sidebar__box'>
        <h4 className='sidebar__title'>Max Price</h4>
        <select defaultValue={this.props.filters.max_price} id='max_price_selector' className='select' onChange={this.handleChange}>
          <option key='any' value=''>Any</option>
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
}

