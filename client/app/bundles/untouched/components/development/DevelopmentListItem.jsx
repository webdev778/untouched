import React, { Component } from 'react';
import { Link } from 'react-router';
import accounting from 'accounting';
import RouteGenerator from '../../route_generator';

export default class DevelopmentListItem extends Component {

  formattedPrice() {
    return accounting.formatMoney(this.props.data.price, '$', 0);
  }

  photoUrl() {
    return __guard__(this.props.data.development.photos[0], x => x.url);
  }

  developmentUrl() {
    return `/developments/${this.props.data.development.id}` +
      new RouteGenerator(this.props.filters).generate();
  }

  render() {
    return <tr>
      <td className="asset-wrap">
        <Link to={this.developmentUrl()} className="asset" style={{backgroundImage: `url(${this.photoUrl()})`}}>
          <div className="asset__text">
            <span className="asset__location">
              {this.props.data.development.address}, {this.props.data.development.suburb_name}
            </span>
          </div>
        </Link>
      </td>
      <td>{this.formattedPrice()}</td>
    </tr>;
  }
}


function __guard__(value, transform) {
  return (typeof value !== 'undefined' && value !== null) ? transform(value) : undefined;
}