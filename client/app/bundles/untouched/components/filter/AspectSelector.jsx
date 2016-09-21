import React, { Component } from 'react';

import SidebarTitle from '../SidebarTitle';
import CheckboxField from '../CheckboxField';

export default class AspectSelector extends Component {

  VALUES = [ 'North', 'East', 'South', 'West' ]

  render() {
    return (
      <div className='sidebar__box'>
        <SidebarTitle value="Aspect" />
        {this.renderCheckboxes()}
      </div>
    );
  }

  renderCheckboxes() {
    const { hasInitialValue, handleClick, getFacetCount } = this;

    return _.map(this.VALUES, value => {
      const strippedValue = _.toLower(value);
      return (
        <CheckboxField 
          id={`aspect_${strippedValue}`}
          key={value}
          checked={hasInitialValue(strippedValue)} 
          facetCount={getFacetCount(strippedValue)}
          value={strippedValue}
          label={value}
          onClick={handleClick} 
          name="aspect" />
      );
    });
  }

  getFacetCount = (value) => {
    return __guard__(_.find(this.props.facets, pair => pair[0] === value), x => x[1]);
  }

  hasInitialValue = (value) => {
    if (!__guard__(this.props.filters, x => x.aspect)) { return false; }
    return _.includes(this.props.filters.aspect, value);
  }

  val() {
    return _.map($("input[name='aspect']:checked"), el => el.value);
  }

  handleClick = (event) => {
    return this.props.actions.filterData({aspect: this.val()});
  }
}




function __guard__(value, transform) {
  return (typeof value !== 'undefined' && value !== null) ? transform(value) : undefined;
}