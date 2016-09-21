import React, { Component } from 'react';

import RouteGenerator from '../../route_generator';

import UnitStore from '../../stores/unit_store';
import UnitActions from '../../actions/unit_actions';
import DismissSidebarTrigger from '../DismissSidebarTrigger';
import FilterSidebar from '../FilterSidebar';

export default class DevelopmentPricingSidebar extends Component {

  state = {
    facets: {}
  }

  componentWillMount() {
    UnitStore.listen(this.onChange);
  }

  componentWillUnmount() {
    UnitStore.unlisten(this.onChange);
  }

  onChange = (state) => {
    this.setState(state);
  }

  render() {
    return (
      <aside className='sidebar'>
        <DismissSidebarTrigger />
        <FilterSidebar
          development={this.props.development}
          actions={UnitActions}
          facets={this.state.facets}
          filters={this.parseFilters()} />
      </aside>
    );
  }

  parseFilters() {
    return RouteGenerator.parse(
      this.props.params.splat,
      `/developments/${this.props.development.id}`
    );
  }
}
