import React, { Component } from 'react';

import SVGIcon from './SVGIcon';

export default class SidebarDevelopmentTrigger extends Component {
  render() {
    return <div className="sidebar-trigger text-center push-right">
        <button type="button" className="btn--flat sidebar-trigger" onClick={this.handleClick}>
          <SVGIcon icon='filter' />
        </button>
      </div>;
  }

  handleClick() {
    return $('body').toggleClass('sidebar-on');
  }
}

