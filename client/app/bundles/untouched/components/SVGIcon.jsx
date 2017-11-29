import React, { Component } from 'react';

export default class SVGIcon extends Component {

  innerHTML() {
    return `<use xmlns:xlink=\"http://www.w3.org/1999/xlink\" xlink:href=\"/images/icons.svg#icon-${this.props.icon}\"></use>`;
  }

  render() {
    return <svg role="img" className={`icon icon--${this.props.icon}`} dangerouslySetInnerHTML={{__html: this.innerHTML()}}></svg>;
  }
}

