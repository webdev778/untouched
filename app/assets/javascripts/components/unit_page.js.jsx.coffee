Scroll = require('react-scroll')
Link   = Scroll.Link
Element = Scroll.Element


window.UnitPage = React.createClass

  scrollNav:
    offset: -200
    duration: 500

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

  componentDidUpdate: (prevProps, prevState) ->
    unless @state.unit is @status.loading
      document.title = [ @state.unit.development.address, @state.unit.number ].join(' ')

      unless prevState.unit is @status.loading
        if @state.unit.development.intercom_app_id
          window.Intercom('boot', { app_id: @state.unit.development.intercom_app_id })
        else
          window.Intercom('shutdown')

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
            {this.renderNav()}
          </div>
        </div>
        <div className="scroll__wrap">
          <div className="scroll__content">
            <Element name="plans">
              <UnitPlansSection unit={this.state.unit}/>
            </Element>
            <Element name="views">
              <UnitViewsSection unit={this.state.unit}/>
            </Element>
            <Element name="costs">
              <UnitCostsSection unit={this.state.unit}/>
            </Element>
          </div>
        </div>
      </div>

     </div>`


  renderNav: ->
    `<div className="scroll__nav scroll__nav--static">
      <ul>
        <li role="presentation" className="scroll__li">
          <Link
            activeClass="active"
            spy={true}
            smooth={true}
            offset={this.scrollNav.offset}
            duration={this.scrollNav.duration}
            to="plans">
            Plans
          </Link>
        </li>
        <li role="presentation" className="scroll__li">
          <Link
            activeClass="active"
            spy={true}
            smooth={true}
            offset={this.scrollNav.offset}
            duration={this.scrollNav.duration}
            to="views">
            Aspect
          </Link>
        </li>
        <li role="presentation" className="scroll__li">
          <Link
            activeClass="active"
            spy={true}
            smooth={true}
            offset={this.scrollNav.offset}
            duration={this.scrollNav.duration}
            to="costs">
            Costs
          </Link>
        </li>
      </ul>
      {this.renderDevelopmentLogo()}
    </div>`

  renderDevelopmentLogo: ->
    if @state.unit.development_logo_url
      `<img src={this.state.unit.development_logo_url} alt={this.state.unit.development.address} className="scroll__logo" />`

