@SVGIcon = React.createClass
  innerHTML: ->
    "<use xmlns:xlink=\"http://www.w3.org/1999/xlink\" xlink:href=\"/images/icons.svg#icon-#{@props.icon}\"></use>"

  render: ->
    `<svg role="img" className={'icon icon--' + this.props.icon} dangerouslySetInnerHTML={{__html: this.innerHTML()}}></svg>`

