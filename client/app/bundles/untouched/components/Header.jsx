import React, { Component } from 'react';
import { Link } from 'react-router';

import SidebarTrigger from './SidebarTrigger'

export default class Header extends Component {

  static defaultProps = {
    fixed_position: true,
    sidebarTrigger: true
  }

  render() {
    return (
      <header className={(this.props.fixed_position && "header header-fixed") || (!this.props.fixed_position && "header")}>
        <div className="container">
          { this.props.sidebarTrigger &&
            <SidebarTrigger />
          }
          <Link to="/" className="header__logo">
            <img src="/images/logo-untouched-white.svg" alt="Untouched" />
          </Link>
        </div>
      </header>
    );
  }
}


