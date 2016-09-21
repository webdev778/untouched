import React, { Component } from 'react';

import DevelopmentListItem from './DevelopmentListItem';

export default class DevelopmentList extends Component {

  render() {
    return (
      <div className='table-responsive'>
        <table className='table'>
          <tbody>
            {this.renderItems()}
          </tbody>
        </table>
      </div>
    );
  }

  renderItems() {
    const { filters } = this.props;
    return _.map(this.props.developments, development => (
      <DevelopmentListItem key={development.id} filters={filters} data={development} />
    ));
  }

  classForHeading(name) {
    if (__guard__(this.props.filters, x => x.sort) === name) { return 'active'; }
  }

  handleSortColumn(name) {
    return () => this.sortColumn(name);
  }

  sortColumn(name) {
    return DevelopmentActions.filterData({sort: name, sort_order: this.toggleSortOrder(name)});
  }

  toggleSortOrder(columnName) {
    // We want to sort ascending if the sort column has changed.
    if (__guard__(this.props.filters, x => x.sort) !== columnName) { return 'asc'; }
    if (__guard__(this.props.filters, x1 => x1.sort_order) === 'desc') { return 'asc'; } else { return 'desc'; }
  }
}


function __guard__(value, transform) {
  return (typeof value !== 'undefined' && value !== null) ? transform(value) : undefined;
}