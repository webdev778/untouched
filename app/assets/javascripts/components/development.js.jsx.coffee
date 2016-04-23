@Development = React.createClass

  componentWillMount: ->
    # TODO: Can we find a less intrusive way to set the body class?
    $('body').addClass('sidebar-hide development')

    DevelopmentStore.listen(@onChange)
    DevelopmentActions.select(@props.params.developmentId)

  onChange: (state) ->
    console.log state
    @setState(state)

  render: ->
    `<div className='development'>

      <Header />

      <main className="main">
        <div className="scroll">
          <DevelopmentScrollNav />
          <div className="scroll__content">
            <DevelopmentOverviewSection development={this.state.development}/>
          </div>
        </div>
      </main>

     </div>`


