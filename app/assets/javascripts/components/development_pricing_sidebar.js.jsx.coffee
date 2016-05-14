@DevelopmentPricingSidebar = React.createClass
  render: ->
    `<aside className='sidebar'>
      <DismissSidebarTrigger />
      <FilterSidebar
        development={this.props.development}
        actions={UnitActions}
        filters={this.parseFilters()} />
    </aside>`

  parseFilters: ->
    RouteGenerator.parse(@props.params.splat)
