import React, { Component } from 'react';

import SidebarTitle from '../SidebarTitle';
import CheckboxField from '../CheckboxField';

export default class ParkingSelector extends Component {

  VALUES = [ '1', '2', '3+' ]

  render() {
    return (
      <div className='sidebar__box'>
        <SidebarTitle value="Car Spaces" />
        {this.renderCheckboxes()}
      </div>
    );
  }

  renderCheckboxes() {
    const { hasInitialValue, handleClick, getFacetCount } = this;

    return _.map(this.VALUES, value => {
      const strippedValue = value.replace('+', '');
      return (
        <CheckboxField
          id={`parking${strippedValue}`}
          key={value}
          checked={hasInitialValue(strippedValue)}
          facetCount={getFacetCount(strippedValue)}
          value={strippedValue}
          label={value}
          onClick={handleClick}
          name="parking" />
      );
    });
  }

  getFacetCount = (value) => {
    return _.get(_.find(this.props.facets, pair => pair[0] === value), [1]);
  }

  val() {
    return _.map($("input[name='parking']:checked"), el => el.value);
  }

  hasInitialValue = (value) => {
    if (!_.get(this.props.filters, 'parking')) { return false; }
    return _.includes(this.props.filters.parking, value);
  }

  handleClick = (event) => {
    return this.props.actions.filterData({parking: this.val()});
  }
}
