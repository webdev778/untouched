class DevelopmentActions
  constructor: ->
    @generateActions(
      'initData',
      'fetch',
      'filterData'
    )

window.DevelopmentActions = alt.createActions(DevelopmentActions)

