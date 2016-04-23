class DevelopmentActions
  constructor: ->
    @generateActions(
      'initData',
      'select',
      'fetch',
      'filterData'
    )

window.DevelopmentActions = alt.createActions(DevelopmentActions)

