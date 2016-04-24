@DevelopmentPricingSidebar = React.createClass
  render: ->
    `<aside className='sidebar'>
      <DismissSidebarTrigger />
      <FilterSidebar
        filters={this.parseFilters()} />
    </aside>`

  parseFilters: ->
    RouteGenerator.parse(@props.params.splat)
