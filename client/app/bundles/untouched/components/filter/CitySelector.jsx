import React, { Component } from 'react';

export default class CitySelector extends Component {

  render() {
    return (
      <div className='form__group'>
        <select className='select'>
          <option key='Melbourne' value='Melbourne'>Melbourne ({this.getFacetCount()})</option>
        </select>
      </div>
    );
  }

  getFacetCount() {
    if (!_.get(this.props.facets, 'city')) { return 0; }
    let facet = _.find(this.props.facets.city, pair => pair[0] === 'Melbourne');
    if (!facet) { return 0; }
    return facet[1];
  }
}
