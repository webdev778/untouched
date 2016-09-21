import React, { Component } from 'react';
import { Link } from 'react-router';

import SVGIcon from '../SVGIcon'

export default class UnitHeaderTable extends Component {

  formattedPrice() {
    return Math.round(this.props.unit.price / 1000.0);
  }

  formattedPricePerM2() {
    return Math.round(this.props.unit.price_per_m2 / 1000.0);
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
              <td><span className="vertical">Aspect</span></td>
              <td><span className="vertical">Car Spaces</span></td>
              <td><span className="vertical">Price</span></td>
              <td><span className="vertical">/ M2</span></td>
            </tr>
            <tr>
              <td>&nbsp;</td>
              <td>{this.props.unit.number}</td>
              <td>{this.props.unit.bedrooms}</td>
              <td>{this.props.unit.bathrooms}</td>
              <td>{this.props.unit.internal_in_meters}</td>
              <td>{this.props.unit.external_in_meters}</td>
              <td>{this.props.unit.aspect}</td>
              <td>{this.props.unit.parking}</td>
              <td>{this.formattedPrice()}</td>
              <td>{this.formattedPricePerM2()}</td>
            </tr>
          </tbody>
        </table>
      </div>
    );
  }
}
