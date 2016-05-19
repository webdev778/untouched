window.DevelopmentOverviewSection = React.createClass
  render: ->
    `<section className="scroll__section">
      <div className="container">
        <div className="container__reset">
          {this.renderPhotos()}
        </div>
      </div>
    </section>`

  renderPhotos: ->
    return unless @props.development
    _.map @props.development.photos, (photo) ->
      `<ImageCard key={photo.id} image={photo} />`

