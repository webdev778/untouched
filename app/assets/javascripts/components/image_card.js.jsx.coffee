@ImageCard = React.createClass

  render: ->
    `<div key={this.props.image.id} className="card">
      <div className="card__img" style={{backgroundImage: 'url('+this.props.image.url+')'}}></div>
      {this.renderCaption()}
    </div>`

  renderCaption: ->
    if @props.image.caption
      `<h4 className="card__caption">{this.props.image.caption}</h4>`

