class TipActions
  constructor: ->
    @generateActions(
      'joyrideCallback',
      'overviewLoaded',
      'tipVisible'
    )

window.TipActions = alt.createActions(TipActions)
