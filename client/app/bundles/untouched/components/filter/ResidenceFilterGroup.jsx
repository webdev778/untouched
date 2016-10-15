import React, { Component } from 'react';

import SidebarTitle from '../SidebarTitle';
import CheckboxField from '../CheckboxField';

export default class ResidenceFilterGroup extends Component {

  fields = {
    study_nook: 'Study nook',
    study_room: 'Study room',
    storage_cage: 'Storage cage',
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
    const facet = _.get(this.props.facets, key);
    if (!facet) return 0;
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
