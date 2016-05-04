class UnitActions
  constructor: ->
    @generateActions(
      'initData',
      'fetch',
      'updateUnit',
      'filterData'
    )

window.UnitActions = alt.createActions(UnitActions)

