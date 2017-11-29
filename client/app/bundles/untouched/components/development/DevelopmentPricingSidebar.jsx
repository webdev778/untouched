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
        <div className="sidebar__content">
          <DismissSidebarTrigger />
          <FilterSidebar
            development={this.props.development}
            actions={UnitActions}
            facets={this.state.facets}
            filters={this.parseFilters()} />
        </div>
        {this.renderShowResults()}
      </aside>
    );
  }

  handleClickSidebarOverlay = () => {
    $('body').removeClass('sidebar-on');
  }

  parseFilters() {
    return RouteGenerator.parse(
      this.props.params.splat,
      `/developments/${this.props.development.id}`
    );
  }

  renderShowResults() {
    if (this.state.units) {
      return (
        <div className="sidebar__show-results" onClick={this.handleClickSidebarOverlay}>Show ({this.state.units.length}) units</div>
      );
    }
  }
}
