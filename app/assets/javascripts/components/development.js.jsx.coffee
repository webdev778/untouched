@Development = React.createClass

  status:
    loading: {}
    notFound: {}

  getInitialState: ->
    {
      development: @status.loading
    }

  componentWillMount: ->
    # TODO: Can we find a less intrusive way to set the body class?
    $('body').addClass('sidebar-hide development')

    DevelopmentStore.listen(@onChange)

  componentDidMount: ->
    DevelopmentActions.select(@props.params.developmentId)

  componentWillUnmount: ->
    DevelopmentStore.unlisten(@onChange)

  onChange: (state) ->
    @setState(state)

  render: ->
    if @state.development is @status.loading
      @renderLoading()
    else
      @renderSuccess()

  renderLoading: ->
    `<div className='development'>
      <Header />
    </div>`

  renderSuccess: ->
    `<div className='development'>

      <Header />

      <main className="main">
        <div className="scroll">
          <DevelopmentScrollNav development={this.state.development}  />
          <div className="scroll__content">
            <DevelopmentOverviewSection development={this.state.development}/>
            <DevelopmentLocationSection development={this.state.development}/>
            <DevelopmentPricingSection params={this.props.params} development={this.state.development}/>
          </div>
        </div>
      </main>

     </div>`


