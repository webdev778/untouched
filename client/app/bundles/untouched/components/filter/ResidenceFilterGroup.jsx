import React, { Component } from 'react';

import SidebarTitle from '../SidebarTitle';
import CheckboxField from '../CheckboxField';

export default class ResidenceFilterGroup extends Component {

  fields = {
    study_nook: 'Study nook',
    storage_cage: 'Storage cage',
    ensuite: 'Ensuite',
    walk_in_wardrobe: 'Walk-in wardrobe',
    penthouse_level: 'Penthouse level',
    no_stacker: 'No stacker'
  }

  renderCheckboxes() {
    const handler = this.handleClick;
    const { hasInitialValue, getFacetCount } = this;

    return _.map(this.fields, (value, key) => {
      return (
        <CheckboxField
          checked={hasInitialValue(key)}
          ref={key}
          key={key}
          id={key}
          value="true"
          facetCount={getFacetCount(key)}
          label={value}
          onClick={handler}
          name={`residence_${key}`} />
      );
    });
  }

  render() {
    return (
      <div className='sidebar__box'>
        <SidebarTitle value="Residence" />
        {this.renderCheckboxes()}
      </div>
    );
  }

  getFacetCount = (key) => {
    const facet = __guard__(this.props.facets, x => x[key]);
    if (!facet) return 0;
    return __guard__(_.find(facet, pair => pair[0] === true.toString()), x1 => x1[1]);
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
    return !!__guard__(this.props.filters, x => x[key]);
  }
}

function __guard__(value, transform) {
  return (typeof value !== 'undefined' && value !== null) ? transform(value) : undefined;
}