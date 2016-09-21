@DismissSidebarTrigger = React.createClass
  handleClick: ->
    $('body').removeClass('sidebar-on')

  render: ->
    `<button className="btn--flat sidebar-trigger" onClick={this.handleClick}>
      <SVGIcon icon='arrow-left' />
    </button>`

