window.DevelopmentOverviewSection = React.createClass

  imagesLoaded: (parentNode) ->
    imgElements = parentNode.querySelectorAll('img')
    unless imgElements.length
      return true

    for img in imgElements
      if !img.complete
        return false

    return true

  handleStateChange: ->
    overviewElement = @overview;
    if @imagesLoaded(overviewElement)
      TipActions.overviewLoaded(true)

  render: ->
    `<section className="scroll__section">
      <div className="container">
        <div className="container__reset" ref={c => this.overview = c}>
          {this.renderPhotos()}
        </div>
      </div>
    </section>`

  renderPhotos: ->
    return unless @props.development
    _.map @props.development.photos, ((photo) ->
      `<ImageCard
        key={photo.id}
        image={photo}
        handleImageLoaded={this.handleStateChange}
        handleImageErrored={this.handleStateChange}
      />`).bind(this)

