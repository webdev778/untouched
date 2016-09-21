import React, { Component } from 'react';
import { Link } from 'react-router';
import accounting from 'accounting';

import TipActions from '../../actions/tip_actions';

export default class UnitListItem extends Component {

  formattedPrice() {
    return accounting.formatMoney(this.props.unit.price, '$', 0);
  }

  formattedPricePerM2() {
    return accounting.formatMoney(this.props.unit.price_per_m2, '$', 0);
  }

  photoUrl() {
    return __guard__(this.props.data.development.photos[0], x => x.url);
  }

  unitUrl() {
    return `/developments/${this.props.unit.development_id}/units/${this.props.unit.id}`;
  }

  _checkViewport = () => {
    let el = document.querySelector('.unit-list-item__tip');
    if (!el) {
      this.stopWatching();
      return;
    }

    let position = el.getBoundingClientRect();
    let isBelowViewBox = window.innerHeight - position.top < 0;
    let isAboveViewBox = position.bottom < 0;
    if (!isBelowViewBox && !isAboveViewBox) {
      this.stopWatching();
      TipActions.tipVisible(true);
    }
  }

  startWatching() {
    window.addEventListener('scroll', this._checkViewport);
    this._interval = setInterval(this._checkViewport, 500);
  }

  stopWatching() {
    window.removeEventListener('scroll', this._checkViewport);
    clearInterval(this._interval);
  }

  componentDidMount() {
    if (this.props.tip) {
      this.startWatching();
    }
  }

  componentWillUnmount() {
    this.stopWatching;
  }

  render() {
    return (
      <tr>
        <td>&nbsp;</td>
        <td className={this.props.tip ? 'unit-list-item__tip' : ''}><Link to={this.unitUrl()}>{this.props.unit.number}</Link></td>
        <td>{this.props.unit.bedrooms}</td>
        <td>{this.props.unit.bathrooms}</td>
        <td>{Math.round(this.props.unit.internal_in_meters)}</td>
        <td>{Math.round(this.props.unit.external_in_meters)}</td>
        <td>{this.props.unit.aspect}</td>
        <td>{this.formattedPrice()}</td>
      </tr>
    );
  }
}

function __guard__(value, transform) {
  return (typeof value !== 'undefined' && value !== null) ? transform(value) : undefined;
}