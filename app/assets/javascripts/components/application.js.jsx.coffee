@Application = React.createClass

  componentWillMount: ->
    DevelopmentStore.listen(@onChange)
    DevelopmentActions.fetch()

    RegionStore.listen(@onChange)
    RegionActions.fetch()

  componentWillUnmount: ->
    @

  onChange: (state) ->
    @setState(state)

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
            filters={this.props.params} 
            developments={this.state.developments} 
            regions={this.state.regions} />
        </aside>

        <main className='main'>
          <DevelopmentList 
            filters={this.props.params} 
            developments={this.state.developments} />
        </main>
      </div>

     </div>`


  handleClickSidebarOverlay: ->
    $('body').removeClass('sidebar-on')

