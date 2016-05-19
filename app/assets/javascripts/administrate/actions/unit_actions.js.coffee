class UnitActions
  constructor: ->
    @generateActions(
      'initData',
      'fetch',
      'updateUnit',
      'createUnit',
      'deleteUnit',
      'filterData'
    )

window.UnitActions = alt.createActions(UnitActions)

