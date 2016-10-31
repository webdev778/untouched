import React, { Component } from 'react';
import { Link } from 'react-router';

import SidebarTrigger from './SidebarTrigger'

export default class Header extends Component {

  static defaultProps = {
    sidebarTrigger: true
  }

  render() {
    return (
      <header className="header">
        <div className="container">
          { this.props.sidebarTrigger &&
            <SidebarTrigger />
          }
          <div className="justifize">
            <div className="justifize__box">
              <Link to="/" className="header__logo">
                <img src="/images/logo-untouched.svg" alt="Untouched" />
              </Link>
            </div>
          </div>
        </div>
      </header>
    );
  }
}


