class UnitActions
  constructor: ->
    @generateActions(
      'initData',
      'fetch',
      'updateUnit',
      'createUnit',
      'filterData'
    )

window.UnitActions = alt.createActions(UnitActions)

