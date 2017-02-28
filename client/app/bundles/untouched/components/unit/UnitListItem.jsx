import React, { Component } from 'react';
import { Link } from 'react-router';
import Waypoint from 'react-waypoint';
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
    return _.get(this.props.data.development.photos[0], 'url');
  }

  unitUrl() {
    // TODO: refactoring
    if (this.props.filters.dhh) {
      return `/dhh/developments/${this.props.unit.development_id}/units/${this.props.unit.id}`;
    } else {
      return `/developments/${this.props.unit.development_id}/units/${this.props.unit.id}`;
    }
  }

  _handleWaypointEnter = () => {
    TipActions.tipVisible(true);
  }

  render() {
    return (
      <tr>
        <td>&nbsp;</td>
        <td className={this.props.tip ? 'unit-list-item__tip' : null}>
          {this.props.tip &&
          <Waypoint scrollableAncestor={window} onEnter={this._handleWaypointEnter} bottomOffset="50px" />
          }
          <Link to={this.unitUrl()}>{this.props.unit.number}</Link>
        </td>
        <td>{this.props.unit.bedrooms}</td>
        <td>{this.formattedFloat(this.props.unit.bathrooms)}</td>
        <td>{this.formattedFloat(this.props.unit.internal_in_meters)}</td>
        <td>{this.formattedFloat(this.props.unit.external_in_meters)}</td>
        <td>{this.props.unit.aspect}</td>
        <td>{this.props.unit.parking}</td>
        <td>{this.formattedPrice()}</td>
      </tr>
    );
  }

  formattedFloat(number) {
    if (number % 1 == 0) {
      return Math.round(number);
    }

    return number;
  }
}
