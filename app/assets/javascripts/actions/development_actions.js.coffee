class DevelopmentActions
  constructor: ->
    @generateActions(
      'initData',
      'filterData'
    )

window.DevelopmentActions = alt.createActions(DevelopmentActions)

