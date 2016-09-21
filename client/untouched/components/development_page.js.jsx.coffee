Joyride = require('react-joyride').default
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
      steps: [{
        title: 'Floorplans',
        text: 'To see floorplans, <i>click</i> the unit number.',
        selector: '.unit-list-item__tip',
        position: 'top',
        type: 'hover',
        style: {
          mainColor: '#03a9f4'
        }
      }]
    }

  hideSidebarIfClickedOutside: (event) ->
    sidebarEl = $('aside.sidebar').get(0)
    triggerEl = $('button.sidebar-trigger').get(0)

    unless $.contains(sidebarEl, event.target) || $.contains(triggerEl, event.target)
      $('body').removeClass('sidebar-on')

  parseFiltersFromUrl: ->
    RouteGenerator.parse(@props.params.splat)

  onChange: (state) ->
    @setState(state)

  componentWillMount: ->
    DevelopmentStore.listen(@onChange)
    TipStore.listen(@onChange)
    $(window).on 'click.development_page', (event) => @hideSidebarIfClickedOutside(event)

  componentDidMount: ->
    DevelopmentActions.select(@props.params.developmentId)

  componentDidUpdate: (prevProps, prevState) ->
    unless @state.development is @status.loading
      document.title = @state.development.address

      if (@state.joyrideStart && !prevState.joyrideStart)
        setTimeout (->
          @joyride.start(true)
        ).bind(this), 100

      if prevState.development is @status.loading
        if @state.development.intercom_app_id
          window.Intercom('boot', { app_id: @state.development.intercom_app_id })
        else
          window.Intercom('shutdown')
    @

  componentWillUnmount: ->
    DevelopmentStore.unlisten(@onChange)
    TipStore.unlisten(@onChange)

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

      <Joyride ref={c => this.joyride = c} callback={TipActions.joyrideCallback} steps={this.state.steps} scrollToFirstStep scrollOffset={200} locale={{ close: 'Got it' }} />

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
          development={this.state.development}
          tip={!this.joyrideShowed}/>
      </Element>
    </div>`
