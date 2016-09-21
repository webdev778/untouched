class UnitActions
  constructor: ->
    @generateActions(
      'initData',
      'select',
      'fetch',
      'filterData'
    )

window.UnitActions = alt.createActions(UnitActions)

