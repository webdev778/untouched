import React, { Component } from 'react';

import SVGIcon from './SVGIcon';

export default class SidebarDevelopmentTrigger extends Component {
  render() {
    return <div className="sidebar-trigger text-center">
        <button type="button" className="btn--flat sidebar-trigger" onClick={this.handleClick}>
          <SVGIcon icon='filter' /> Filter
        </button>
      </div>;
  }

  handleClick() {
    return $('body').toggleClass('sidebar-on');
  }
}

