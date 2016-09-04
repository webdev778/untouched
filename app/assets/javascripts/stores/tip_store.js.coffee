class TipStore

  @displayName: 'TipStore'

  constructor: ->
    @bindActions(TipActions)
    @joyrideShowed = localStorage.getItem('joyrideShowed')
    @joyrideStart = false

    @overviewLoaded = false
    @tipVisible = false

  joyrideCallback: (props)->
    if props.type == 'finished'
      @joyrideShowed = true
      localStorage.setItem('joyrideShowed', true)

  overviewLoaded: (prop)->
    @overviewLoaded = prop
    @changeJoyrideStart()

  tipVisible: (prop)->
    @tipVisible = prop
    @changeJoyrideStart()

  changeJoyrideStart: ->
    @joyrideStart = !@joyrideShowed && @overviewLoaded && @tipVisible
    @emitChange()

window.TipStore = alt.createStore(TipStore)
