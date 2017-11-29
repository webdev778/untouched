import React, { Component } from 'react';

export default class DevelopmentLocationSection extends Component {

  componentDidMount() {
    if (this.hasGeoData()) { return this.initializeMap(); }
  }

  hasGeoData() {
    return this.props.development.lat && this.props.development.lng;
  }

  initializeMap() {
    const loc = new google.maps.LatLng(this.props.development.lat, this.props.development.lng);

    const map = new google.maps.Map(document.getElementById("map"), {
      zoom: 17,
      center: loc,
      scrollwheel: false,
      div: '#map',
      draggable: document.documentElement.ontouchstart === undefined
    });

    const marker = new google.maps.Marker({
      map,
      position: loc,
      visible: true
    });

    const infobox = new InfoBox({
      content: document.getElementById("infobox"),
      disableAutoPan: false,
      pixelOffset: new google.maps.Size(10, -20),
      zIndex: null,
      boxStyle: {
        opacity: 0.75
      },
      closeBoxMargin: "12px 4px 2px 2px",
      closeBoxURL: "http://www.google.com/intl/en_us/mapfiles/close.gif",
      infoBoxClearance: new google.maps.Size(1, 1)
    });

    return infobox.open(map, marker);
  }

  render() {

    if (this.hasGeoData()) {
      return this.renderMap();
    } else {
      return this.renderBlank();
    }
  }

  renderMap() {
    return (
      <section className="scroll__section">
        <div className="container no-padding">
          <div id="map" className="map"></div>
          {this.renderInfoBox()}
        </div>
      </section>
    );
  }

  renderInfoBox() {
    if (!this.props.development) { return; }
    return (
      <div id="infobox">
        {this.props.development.address}, {this.props.development.suburb_name}, {this.props.development.region_name}, {this.props.development.city}
      </div>
    );
  }

  renderBlank() {
    return <section className="scroll__section"></section>;
  }
}

