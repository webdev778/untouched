import React, { Component } from 'react';

import SidebarTitle from '../SidebarTitle';
import CheckboxField from '../CheckboxField';

export default class AspectSelector extends Component {

  VALUES = [ 'North', 'East', 'South', 'West', 'North/East', 'South/East', 'South/West', 'North/West' ]

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
      const strippedValue = _.toLower(value).replace('/', '_');
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
    return _.get(_.find(this.props.facets, pair => pair[0] === value), [1]);
  }

  hasInitialValue = (value) => {
    if (!_.get(this.props.filters, 'aspect')) { return false; }
    return _.includes(this.props.filters.aspect, value);
  }

  val() {
    return _.map($("input[name='aspect']:checked"), el => el.value);
  }

  handleClick = (event) => {
    return this.props.actions.filterData({aspect: this.val()});
  }
}
