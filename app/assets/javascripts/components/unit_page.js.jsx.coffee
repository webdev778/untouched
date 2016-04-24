@UnitPage = React.createClass

  status:
    loading: {}
    notFound: {}

  getInitialState: ->
    {
      unit: @status.loading
    }

  componentWillMount: ->
    # TODO: Can we find a less intrusive way to set the body class?
    $('body').addClass('sidebar-hide development')

    UnitStore.listen(@onChange)

  componentDidMount: ->
    UnitActions.select(@props.params.developmentId, @props.params.unitId)

  componentWillUnmount: ->
    UnitStore.unlisten(@onChange)

  onChange: (state) ->
    @setState(state)

  render: ->
    if @state.unit is @status.loading
      @renderLoading()
    else
      @renderSuccess()

  renderLoading: ->
    `<div className='unit-page'>
      <Header />
    </div>`

  renderSuccess: ->
    `<div className='unit-page'>

      <Header />

      <div className="scroll">
        <div className="scroll__fixed">
          <div className="container">
            <UnitHeaderTable unit={this.state.unit} />
            <UnitScrollNav unit={this.state.unit} />
          </div>
        </div>
        <div className="scroll__wrap">
          <div className="scroll__content">
            <UnitViewsSection unit={this.state.unit}/>
            <UnitPlansSection unit={this.state.unit}/>
            <UnitCostsSection unit={this.state.unit}/>
          </div>
        </div>
      </div>

     </div>`


