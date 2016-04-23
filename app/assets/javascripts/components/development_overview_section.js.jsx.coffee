@DevelopmentOverviewSection = React.createClass
  render: ->
    `<section className="scroll__section">
      <a name="overview"></a>
      <div className="container">
        <div className="container__reset">
          {this.renderPhotos()}
        </div>
      </div>
    </section>`

  renderPhotos: ->
    return unless @props.development
    _.map @props.development.photos, (photo) ->
      `<div key={photo.id} className="card">
        <div className="card__img" style={{backgroundImage: 'url('+photo.url+')'}}></div>
        <h4 className="card__caption">{photo.caption}</h4>
      </div>`
