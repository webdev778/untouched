import React, { Component } from 'react';

import SidebarTitle from '../SidebarTitle';
import CheckboxField from '../CheckboxField';

export default class BathroomSelector extends Component {

  VALUES = [ '1', '2', '3+' ]

  render() {
    return (
      <div className='sidebar__box'>
        <SidebarTitle value="Bathrooms" />
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
          id={`bathrooms${strippedValue}`}
          key={value}
          checked={hasInitialValue(strippedValue)} 
          facetCount={getFacetCount(strippedValue)}
          value={strippedValue}
          label={value}
          onClick={handleClick} 
          name="bathrooms" />
      );
    });
  }

  hasInitialValue = (value) => {
    if (!__guard__(this.props.filters, x => x.bathrooms)) { return false; }
    return _.includes(this.props.filters.bathrooms, value);
  }

  getFacetCount = (value) => {
    return __guard__(_.find(this.props.facets, pair => pair[0] === value), x => x[1]);
  }

  val() {
    return _.map($("input[name='bathrooms']:checked"), el => el.value);
  }

  handleClick = (event) => {
    return this.props.actions.filterData({bathrooms: this.val()});
  }
}

function __guard__(value, transform) {
  return (typeof value !== 'undefined' && value !== null) ? transform(value) : undefined;
}