@ImageCard = React.createClass

  render: ->
    `<div key={this.props.image.id} className="card">
      <img src={this.props.image.url} />
      {this.renderCaption()}
    </div>`

  renderCaption: ->
    if @props.image.caption
      `<h4 className="card__caption" dangerouslySetInnerHTML={{__html: this.props.image.caption_html}} />`

