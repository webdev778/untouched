@Application = React.createClass

  componentWillMount: ->
    DevelopmentStore.listen(@onChange)
    DevelopmentActions.initData(@props)

  componentWillUnmount: ->
    @

  onChange: (state) ->
    @setState(state)

  render: ->
    `<div className='application'>
      <Header />
      <div className='container'>
        <aside className='sidebar'>
          <DevelopmentFilter developments={this.state.developments} />
        </aside>
        <main className='main'>
          <DevelopmentList developments={this.state.developments} />
        </main>
      </div>
     </div>`


