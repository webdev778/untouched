import React, { Component } from 'react';
import { Link } from 'react-router';

import SidebarTrigger from './SidebarTrigger'

export default class Header extends Component {

  render() {
    return (
      <header className="header">
        <div className="container">
          <SidebarTrigger />
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


