@DevelopmentsPage = React.createClass

  getInitialState: ->
    {
      developments: []
    }

  componentWillMount: ->
    DevelopmentStore.listen(@onChange)
    $(window).resize => @onResize()

  componentDidMount: ->
    DevelopmentActions.filterData(@parseFilters())
    DevelopmentActions.fetch()

  componentWillUnmount: ->
    p 'unmounting'
    DevelopmentStore.unlisten(@onChange)

  componentDidUpdate: ->
    @onResize()

  onResize: ->
    $('.asset-wrap').each ->
      assetW = $(@).width()
      $(@).css('height', assetW / 1.75)

  onChange: (state) ->
    @setState(state)

  parseFilters: ->
    RouteGenerator.parse(@props.params.splat)

  render: ->
    `<div className="developments-page">

      <div 
        className="sidebar-overlay" 
        onClick={this.handleClickSidebarOverlay}></div>

      <Header />

      <div className='container'>
        <aside className='sidebar'>
          <DismissSidebarTrigger />
          <FilterSidebar
            filters={this.parseFilters()} 
            actions={DevelopmentActions} />
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

