import React, { Component } from 'react';

import SidebarTitle from '../SidebarTitle';
import CheckboxField from '../CheckboxField';

import RegionStore from '../../stores/region_store';
import DevelopmentStore from '../../stores/development_store';
import RegionActions from '../../actions/region_actions';

export default class RegionSelector extends Component {

  state = {}

  componentWillMount() {
    RegionStore.listen(this.onChange);
    DevelopmentStore.listen(this.onChange);
    RegionActions.fetch();
  }

  componentWillUnmount() {
    RegionStore.unlisten(this.onChange);
    DevelopmentStore.unlisten(this.onChange);
  }

  renderOptions() {
    const { getFacetCount } = this;
    return _.map(this.state.regions, region => {
      return <option key={region.name} value={region.id}>{region.name} ({getFacetCount(region.name)})</option>;
    });
  }

  onChange = (state) => {
    this.setState(state);
  }

  getFacetCount = (regionName) => {
    if (!this.props.facets) { return 0; }
    let facet = this.props.facets.region_name;
    let pair = _.find(facet, pair => pair[0] === regionName);
    if (!pair) { return 0; }
    return pair[1];
  }

  renderSuburbSelectors = () => {
    if (!this.getSelectedRegion()) { return; }

    const handler = this.handleChangeSuburb;
    const { hasInitialSuburb, getSuburbFacetCount } = this;

    return _.map(this.getSelectedRegion().suburbs, suburb => (
      <CheckboxField
        id={`suburb${suburb.id}`}
        checked={hasInitialSuburb(suburb.id)}
        key={suburb.id}
        value={suburb.id}
        facetCount={getSuburbFacetCount(suburb)}
        label={suburb.name}
        onClick={handler}
        name="suburb" />
    ));
  }

  getSuburbFacetCount = (suburb) => {
    let facet = this.props.facets.suburb_name;
    if (!facet) return 0;
    let pair = _.find(facet, pair => pair[0] === suburb.name);
    if (!pair) return 0;
    return pair[1];
  }

  renderSuburbTitle() {
    if (!this.getSelectedRegion()) return;
    return <SidebarTitle value='Suburb' />;
  }

  initialValue() {
    return __guard__(this.state.filterParams, x => x.region);
  }

  hasInitialSuburb = (id) => {
    return _.includes(__guard__(this.props.filters, x => x.suburb), id.toString());
  }

  getTotalFacetCount() {
    if (!__guard__(this.props.facets, x => x.city)) { return 0; }
    let facet = _.find(this.props.facets.city, pair => pair[0] === 'Melbourne');
    if (!facet) return 0;
    return facet[1];
  }

  render() {
    return (
      <div className='form__group'>
        <select ref="regionSelector" value={this.initialValue()} id='region_selector' className='select' onChange={this.handleChangeRegion}>
          <option key='any' value=''>{`All Regions (${this.getTotalFacetCount()})`}</option>
          {this.renderOptions()}
        </select>

        {this.renderSuburbTitle()}
        {this.renderSuburbSelectors()}
      </div>
    );
  }

  suburbVal() {
    return _.map($("input[name='suburb']:checked"), el => el.value);
  }

  getSelectedRegionId() {
    let id = __guard__(this.refs.regionSelector, x => x.value);
    if (id) {
      return parseInt(id);
    } else {
      return null;
    }
  }

  getSelectedRegion() {
    return _.find(this.state.regions, r => r.id === this.getSelectedRegionId());
  }

  handleChangeRegion = () => {
    return this.props.actions.filterData({region: this.getSelectedRegionId(), suburb: []});
  }

  handleChangeSuburb = () => {
    return this.props.actions.filterData({suburb: this.suburbVal()});
  }
}

function __guard__(value, transform) {
  return (typeof value !== 'undefined' && value !== null) ? transform(value) : undefined;
}