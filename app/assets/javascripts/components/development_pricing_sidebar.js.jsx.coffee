@DevelopmentPricingSidebar = React.createClass
  render: ->
    `<aside className='sidebar'>
      <DismissSidebarTrigger />
      <DevelopmentFilter 
        filters={this.parseFilters()} />
    </aside>`

  parseFilters: ->
    RouteGenerator.parse(@props.params.splat)
