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
    @onResize()


  componentDidUpdate: ->
    $(window).on 'resize:development_page', @onResize
    $(window).on 'scroll:development_page', @onScroll
    @initializeSidebarScroll()
    @allowTogglingSidebar()
    @initializeScrollAnimations()


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


  #=====================================================================#
  # Here be jQuery Dragons!
  # TODO: Can we do all of this without obstructive JS?
  #=====================================================================# 

  onResize: ->
    if $(window).width() > 768
      $('.scroll__pricing .sticky-header').floatThead scrollingTop: 110
    else
      $('.scroll__pricing .sticky-header').floatThead scrollingTop: 100
    return

  onScroll: ->
    top = $('.sidebar-wrap').offset().top - 200
    if $(window).scrollTop() < top
      $('.sidebar-wrap').removeClass 'sidebar-wrap--scroll'
    else
      $('.sidebar-wrap').addClass 'sidebar-wrap--scroll'

  disableScroll: ->
    @oldScrollPos = $(window).scrollTop()
    $(window).on 'scroll.scrolldisabler', (event) =>
      $(window).scrollTop @oldScrollPos
      event.preventDefault()

  enableScroll: ->
    $(window).off 'scroll.scrolldisabler'

  initializeSidebarScroll: ->
    disableScroll = @disableScroll
    enableScroll  = @enableScroll
    $('.sidebar-wrap').scroll ->
      if $(@).scrollTop() == 0
        disableScroll()
        setTimeout (=>
          enableScroll()
        ), 1000

  allowTogglingSidebar: ->
    $('.scroll__nav--fixed a').click ->
      $(this).parent().siblings().removeClass 'active'
      $(this).parent().addClass 'active'
      return

  initializeScrollAnimations: ->
    $('.scroll__section a[name]').onScreen
      container: window
      tolerance: 0
      throttle: 50
      doIn: ->
        target = $(this).attr('name')
        $(this).parents('.scroll').find('.scroll__li').removeClass 'active'
        $('a[href="#' + target + '"]').parent().addClass 'active'

    $('a[name="pricing"]').onScreen
      container: window
      tolerance: 0
      throttle: 50
      doIn: ->
        if $(window).width() < 769
          $('.development').addClass('sidebar-show').removeClass 'sidebar-hide'
      doOut: ->
        if $(window).width() < 769
          $('.development').removeClass('sidebar-show').addClass 'sidebar-hide'

    $(".scroll__nav a").click ->
      $('html, body').animate({
        scrollTop: $('[name="' + $.attr(this, 'href').substr(1) + '"]').offset().top - 150
      }, 500)
      false

