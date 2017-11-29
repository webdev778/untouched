import React, { Component } from 'react';
import { Link } from 'react-router';
import accounting from 'accounting';
import RouteGenerator from '../../route_generator';

export default class DevelopmentFeed extends Component {

  formattedPrice() {
    return accounting.formatMoney(this.props.data.price, '$', 0);
  }

  photoUrl() {
    return _.get(this.props.data.photos[0], 'url');
  }

  developmentLogoUrl() {
    return this.props.data.development_logo_url;
  }

  developerLogoUrl() {
    return this.props.data.developer_logo_url;
  }

  developmentUrl() {
    return `/dhh/developments/${this.props.data.id}`;
  }

  render() {
    return <div className="block-container animate">
      <div className="block">
        <div className="block__header">
          <img src={this.developerLogoUrl()} alt="Developer Logo" />
          <img src={this.developmentLogoUrl()} alt="Development Logo" />
        </div>
        <img src={this.photoUrl()} alt="Development" className="block__img feed__img" />
      </div>
      <span className="block-subtitle">{this.props.data.time_ago} ago</span>
    </div>;


  }
}
