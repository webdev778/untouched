import React, { Component } from 'react';

import UnitStore from '../../stores/unit_store';
import UnitActions from '../../actions/unit_actions';

import UnitListItem from './UnitListItem'

export default class UnitList extends Component {

  state = {
    units: []
  }

  componentWillMount() {
    UnitStore.listen(this.onChange);
    UnitActions.initData(this.getFilterParams());
  }

  componentWillUnmount() {
    UnitStore.unlisten(this.onChange);
  }

  onChange = (state) => {
    this.setState(state);
  }

  getFilterParams() {
    return _.assign({ development_id: this.props.development.id }, this.props.filters);
  }

  render() {
    return (
      <div className='table-responsive'>
        <table className='table'>
          <thead>
            <tr>
              <th>&nbsp;</th>
              {this.renderHeadings()}
              {this.props.development.show_per_m2 &&
              <th key={"price_per_m2"} className={this.classForHeading('price_per_m2')} onClick={this.handleSortColumn('price_per_m2')}>Per m<sup>2</sup></th>
              }
            </tr>
          </thead>
          <tbody>
            {this.state.units.map((unit, index) => {
              if (index === 0) {
                return <UnitListItem key={unit.id} unit={unit} filters={this.props.filters} tip={this.props.tip} />;
              } else {
                return <UnitListItem key={unit.id} unit={unit} filters={this.props.filters} />;
              }
            })}
          </tbody>
        </table>
      </div>
    );
  }

  HEADINGS = {
    number: 'Unit',
    bedrooms: 'Beds',
    bathrooms: 'Baths',
    internal_in_meters: 'Int M2',
    external_in_meters: 'Ext M2',
    aspect: 'Aspect',
    parking: 'Car',
    price: 'Price'
  }

  renderHeadings() {
    let { classForHeading } = this;
    let { handleSortColumn } = this;
    return _.map(this.HEADINGS, (title, column) => (
      <th key={column} className={classForHeading(column)} onClick={handleSortColumn(column)}>{title}</th>
    ));
  }

  classForHeading = (name) => {
    if (_.get(this.state.filterParams, 'sort') === name) { return 'active'; }
  }

  handleSortColumn = (name) => {
    return () => this.sortColumn(name);
  }

  sortColumn(name) {
    return UnitActions.filterData({sort: name, sort_order: this.toggleSortOrder(name)});
  }

  toggleSortOrder(columnName) {
    // We want to sort ascending if the sort column has changed.
    if (_.get(this.state.filterParams, 'sort') !== columnName) { return 'asc'; }
    if (_.get(this.state.filterParams, 'sort_order') === 'desc') { return 'asc'; } else { return 'desc'; }
  }
}
