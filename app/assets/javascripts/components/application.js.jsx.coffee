@Application = React.createClass

  componentWillMount: ->
    DevelopmentStore.listen(@onChange)
    DevelopmentActions.filterData(@parseFilters())
    DevelopmentActions.fetch()

    RegionStore.listen(@onChange)
    RegionActions.fetch()

    $(window).resize => @onResize()

  componentDidUpdate: ->
    @onResize()

  onResize: ->
    $('.asset-wrap').each ->
      assetW = $(@).width()
      $(@).css('height', assetW / 1.75)

  componentWillUnmount: ->
    @

  onChange: (state) ->
    @setState(state)

  parseFilters: ->
    RouteGenerator.parse(@props.params.splat)

  render: ->
    `<div className='application'>

      <div 
        className="sidebar-overlay" 
        onClick={this.handleClickSidebarOverlay}></div>

      <Header />

      <div className='container'>
        <aside className='sidebar'>
          <DismissSidebarTrigger />
          <DevelopmentFilter 
            filters={this.parseFilters()} 
            developments={this.state.developments} 
            regions={this.state.regions} />
        </aside>

        <main className='main'>
          <DevelopmentList 
            filters={this.parseFilters()} 
            developments={this.state.developments} />
        </main>
      </div>

     </div>`


  handleClickSidebarOverlay: ->
    $('body').removeClass('sidebar-on')

