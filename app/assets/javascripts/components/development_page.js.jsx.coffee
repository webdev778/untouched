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
    $(window).on 'click.development_page', (event) => @hideSidebarIfClickedOutside(event)

  hideSidebarIfClickedOutside: (event) ->
    sidebarEl = $('aside.sidebar').get(0)
    triggerEl = $('button.sidebar-trigger').get(0)

    unless $.contains(sidebarEl, event.target) || $.contains(triggerEl, event.target)
      $('body').removeClass('sidebar-on')

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

  onChange: (state) ->
    @setState(state)

  render: ->
    if @state.development is @status.loading
      @renderLoading()
    else
      @renderSuccess()

  renderLoading: ->
    `<div className='development development-page'>
      <Header />
    </div>`

  renderSuccess: ->
    `<div className='development development-page'>

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
