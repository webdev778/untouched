@ImageCard = React.createClass

  getDefaultProps: ->
    {
      handleImageLoaded: () -> {}
      handleImageErrored: () -> {}
    }

  render: ->
    `<div key={this.props.image.id} className="card">
      <img src={this.props.image.url} onLoad={this.props.handleImageLoaded} onError={this.props.handleImageErrored}/>
      {this.renderCaption()}
    </div>`

  renderCaption: ->
    if @props.image.caption
      `<h4 className="card__caption" dangerouslySetInnerHTML={{__html: this.props.image.caption_html}} />`

