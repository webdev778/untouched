import React, { Component } from 'react';

import SidebarTitle from '../SidebarTitle';
import CheckboxField from '../CheckboxField';

export default class BuildingFilterGroup extends Component {

  fields = {
    gym: 'Gym',
    pool: 'Pool',
    spa: 'Spa',
    sauna: 'Sauna',
    steam_room: 'Steam room',
    rooftop_deck: 'Rooftop deck'
  }

  renderCheckboxes() {
    const handler = this.handleClick;
    const { hasInitialValue, getFacetCount } = this;
    return _.map(this.fields, (value, key) => (
      <CheckboxField
        checked={hasInitialValue(key)}
        key={key}
        id={key}
        value="true"
        label={value}
        facetCount={getFacetCount(key)}
        onClick={handler}
        name={`building_${key}`} />
    ));
  }

  render() {
    return (
      <div className='sidebar__box'>
        <SidebarTitle value="Building" />
        {this.renderCheckboxes()}
      </div>
    );
  }

  getFacetCount = (key) => {
    const facet = _.get(this.props.facets, key);
    if (!facet) { return 0; }
    return _.get(_.find(facet, pair => pair[0] === true.toString()), [1]);
  }

  handleClick = (event) => {
    let params = {};

    if ($(event.target).is(':checked')) {
      params[event.target.id] = true;
    } else {
      params[event.target.id] = undefined;
    }

    return this.props.actions.filterData(params);
  }

  hasInitialValue = (key) => {
    return !!_.get(this.props.filters, key);
  }
}
