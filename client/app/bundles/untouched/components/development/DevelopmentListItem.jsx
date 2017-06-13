import React, { Component } from 'react';
import { Link } from 'react-router';
import accounting from 'accounting';
import RouteGenerator from '../../route_generator';

export default class DevelopmentListItem extends Component {

  formattedPrice() {
    return accounting.formatMoney(this.props.data.price, '$', 0);
  }

  photoUrl() {
    return _.get(this.props.data.development.photos[0], 'url');
  }

  developmentUrl() {
    // TODO: refactoring
    if (this.props.filters.dhh) {
      return `/dhh/developments/${this.props.data.development.id}` +
        new RouteGenerator({sort: "price", sort_order: "desc", private: true, dhh: 1}).generate();
    } else {
      return `/developments/${this.props.data.development.id}` +
        new RouteGenerator({sort: "price", sort_order: "desc"}).generate();
    }
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
      <td style={{position: 'relative'}}>
        {this.formattedPrice()}
        <Link to={this.developmentUrl()} className="link-box" />
      </td>
    </tr>;
  }
}
