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
    return __guard__(_.find(this.props.facets, pair => pair[0] === value), x => x[1]);
  }

  val() {
    return _.map($("input[name='parking']:checked"), el => el.value);
  }

  hasInitialValue = (value) => {
    if (!__guard__(this.props.filters, x => x.parking)) { return false; }
    return _.includes(this.props.filters.parking, value);
  }

  handleClick = (event) => {
    return this.props.actions.filterData({parking: this.val()});
  }
}

function __guard__(value, transform) {
  return (typeof value !== 'undefined' && value !== null) ? transform(value) : undefined;
}