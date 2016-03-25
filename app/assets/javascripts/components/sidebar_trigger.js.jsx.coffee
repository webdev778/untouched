@SidebarTrigger = React.createClass
  render: ->
    `<button type="button" className="btn--flat sidebar-trigger" onClick={this.handleClick}>
      <SVGIcon icon='filter' />
    </button>`

  handleClick: ->
    $('body').toggleClass('sidebar-on')

