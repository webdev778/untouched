import React, { Component } from 'react';

import SidebarTitle from '../SidebarTitle';
import CheckboxField from '../CheckboxField';

export default class UnitTypeFilterGroup extends Component {

  fields = {
    apartment: 'Apartment',
    townhouse: 'Townhouse'
  }

  renderCheckboxes() {
    const handler = this.handleClick;
    const { hasInitialValue, getFacetCount } = this;

    return _.map(this.fields, (value, key) => (
      <CheckboxField
        checked={hasInitialValue(key)}
        key={key}
        id={key}
        value={key}
        facetCount={getFacetCount(key)}
        label={value}
        onClick={handler}
        name='unit_type' />
    ));
  }

  getFacetCount = (key) => {
    return _.get(_.find(this.props.facets, pair => pair[0] === key), [1]);
  }

  render() {
    return (
      <div className='sidebar__box'>
        <SidebarTitle value="Type" />
        {this.renderCheckboxes()}
      </div>
    );
  }

  val() {
    return _.map($("input[name='unit_type']:checked"), el => el.value);
  }

  handleClick = (event) => {
    return this.props.actions.filterData({unit_type: this.val()});
  }

  hasInitialValue = (key) => {
    return _.includes(_.get(this.props.filters, 'unit_type'), key);
  }
}
