@DevelopmentPricingSidebar = React.createClass

  getInitialState: ->
    {
      facets: {}
    }

  componentWillMount: ->
    UnitStore.listen(@onChange)
  componentWillUnmount: ->
    UnitStore.unlisten(@onChange)

  onChange: (state) ->
    @setState(state)

  render: ->
    `<aside className='sidebar'>
      <DismissSidebarTrigger />
      <FilterSidebar
        development={this.props.development}
        actions={UnitActions}
        facets={this.state.facets}
        filters={this.parseFilters()} />
    </aside>`

  parseFilters: ->
    RouteGenerator.parse(
      @props.params.splat,
      '/developments/' + @props.development.id
    )
