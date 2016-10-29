import React, { Component } from 'react';
import { Link } from 'react-router';
import accounting from 'accounting';

import SVGIcon from '../SVGIcon'

export default class UnitHeaderTable extends Component {

  formattedFloat(number) {
    if (number % 1 == 0) {
      return Math.round(number);
    }

    return number;
  }

  formattedPrice() {
    return accounting.formatMoney(this.props.unit.price, '$', 0);
  }

  developmentUrl() {
    return `/developments/${this.props.unit.development_id}`;
  }

  handleBack(event) {
    event.preventDefault();
    event.stopPropagation();
    window.history.back();
    return false;
  }

  render() {
    return (
      <div className="table-responsive table--noactive">
        <table className="table table--fixed">
          <tbody>
            <tr className="thead">
              <td rowSpan="2" className="btn-wrap">
                <Link to={this.developmentUrl()} onClick={this.handleBack} className="btn--back">
                  <SVGIcon icon="arrow-left" />
                </Link>
              </td>
              <td>&nbsp;</td>
              <td><span className="vertical">Unit</span></td>
              <td><span className="vertical">Beds</span></td>
              <td><span className="vertical">Baths</span></td>
              <td><span className="vertical">Int M2</span></td>
              <td><span className="vertical">Ext M2</span></td>
              <td><span className="vertical">Car</span></td>
              <td><span className="vertical">Price</span></td>
            </tr>
            <tr>
              <td>&nbsp;</td>
              <td>{this.props.unit.number}</td>
              <td>{this.props.unit.bedrooms}</td>
              <td>{this.formattedFloat(this.props.unit.bathrooms)}</td>
              <td>{this.formattedFloat(this.props.unit.internal_in_meters)}</td>
              <td>{this.formattedFloat(this.props.unit.external_in_meters)}</td>
              <td>{this.props.unit.parking}</td>
              <td>{this.formattedPrice()}</td>
            </tr>
          </tbody>
        </table>
      </div>
    );
  }
}
