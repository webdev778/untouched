Scroll = require('react-scroll')
Link   = Scroll.Link
Element = Scroll.Element

window.DevelopmentPage = React.createClass

  scrollNav:
    offset: -200
    duration: 500

  status:
    loading: {}
    notFound: {}

  getInitialState: ->
    {
      development: @status.loading
      filterParams: @parseFiltersFromUrl()
    }

  componentWillMount: ->
    DevelopmentStore.listen(@onChange)

  componentDidMount: ->
    DevelopmentActions.select(@props.params.developmentId)

  parseFiltersFromUrl: ->
    RouteGenerator.parse(@props.params.splat)

  componentDidUpdate: ->
    if @state.development
      document.title = @state.development.address
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
          {this.renderNav()}
          {this.renderSections()}
        </div>
      </main>

     </div>`


  renderNav: ->
    `<div className="scroll__nav scroll__nav--fixed">
      <ul>
        <li role="presentation" className="scroll__li">
          <Link
            activeClass="active"
            spy={true}
            smooth={true}
            offset={this.scrollNav.offset}
            duration={this.scrollNav.duration}
            to="overview">
            Overview
          </Link>
        </li>
        <li role="presentation" className="scroll__li">
          <Link
            activeClass="active"
            spy={true}
            smooth={true}
            offset={this.scrollNav.offset}
            duration={this.scrollNav.duration}
            to="location">
            Location
          </Link>
        </li>
        <li role="presentation" className="scroll__li">
          <Link
            activeClass="active"
            spy={true}
            smooth={true}
            offset={this.scrollNav.offset}
            duration={this.scrollNav.duration}
            to="pricing">
            Pricing
          </Link>
        </li>
      </ul>
      {this.renderLogo()}
    </div>`

  renderLogo: ->
    return '' unless @state.development.logo_url
    `<img src={this.state.development.logo_url} alt={this.state.development.address} className="scroll__logo" />`

  renderSections: ->
    `<div className="scroll__content">
      <Element name="overview">
        <DevelopmentOverviewSection development={this.state.development}/>
      </Element>
      <Element name="location">
        <DevelopmentLocationSection development={this.state.development}/>
      </Element>
      <Element name="pricing">
        <DevelopmentPricingSection
          params={this.props.params}
          filters={this.parseFiltersFromUrl()}
          development={this.state.development}/>
      </Element>
    </div>`
