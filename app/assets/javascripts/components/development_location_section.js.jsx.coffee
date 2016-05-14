window.DevelopmentLocationSection = React.createClass
  componentDidMount: ->
    @initializeMap() if @hasGeoData()

  hasGeoData: ->
    @props.development.lat &&
      @props.development.lng

  initializeMap: ->
    loc = new google.maps.LatLng(@props.development.lat, @props.development.lng)

    map = new google.maps.Map(document.getElementById("map"), {
      zoom: 17,
      center: loc,
      scrollwheel: false,
      div: '#map',
      draggable: !('ontouchstart' in document.documentElement)
    })

    marker = new google.maps.Marker
      map: map,
      position: loc,
      visible: true

    infobox = new InfoBox(
      content: document.getElementById("infobox")
      disableAutoPan: false
      pixelOffset: new google.maps.Size(10, -20)
      zIndex: null
      boxStyle:
        opacity: 0.75
      closeBoxMargin: "12px 4px 2px 2px"
      closeBoxURL: "http://www.google.com/intl/en_us/mapfiles/close.gif"
      infoBoxClearance: new google.maps.Size(1, 1)
    )

    infobox.open map, marker

  render: ->

    if @hasGeoData()
      @renderMap()
    else
      @renderBlank()

  renderMap: ->
    `<section className="scroll__section">
      <div className="container">
        <div id="map" className="map"></div>
        {this.renderInfoBox()}
      </div>
    </section>`

  renderInfoBox: ->
    return unless @props.development
    `<div id="infobox">
      {this.props.development.address}, {this.props.development.suburb_name}, {this.props.development.region_name}, {this.props.development.city}
    </div>`

  renderBlank: ->
    `<section className="scroll__section"></section>`

