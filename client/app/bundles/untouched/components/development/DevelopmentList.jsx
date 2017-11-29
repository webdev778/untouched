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
    if (_.get(this.props.filters, 'sort') === name) { return 'active'; }
  }

  handleSortColumn(name) {
    return () => this.sortColumn(name);
  }

  sortColumn(name) {
    return DevelopmentActions.filterData({sort: name, sort_order: this.toggleSortOrder(name)});
  }

  toggleSortOrder(columnName) {
    // We want to sort ascending if the sort column has changed.
    if (_.get(this.props.filters, 'sort') !== columnName) { return 'asc'; }
    if (_.get(this.props.filters, 'sort_order') === 'desc') { return 'asc'; } else { return 'desc'; }
  }
}
