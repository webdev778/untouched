@DevelopmentPage = React.createClass

  status:
    loading: {}
    notFound: {}

  getInitialState: ->
    {
      development: @status.loading
    }

  componentWillMount: ->
    DevelopmentStore.listen(@onChange)

  componentDidMount: ->
    DevelopmentActions.select(@props.params.developmentId)

  componentDidUpdate: ->
    @

  componentWillUnmount: ->
    DevelopmentStore.unlisten(@onChange)

    $(window).off 'resize:development_page'
    $(window).off 'scroll:development_page'

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
    `<div className='sidebar-hide development'>

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


