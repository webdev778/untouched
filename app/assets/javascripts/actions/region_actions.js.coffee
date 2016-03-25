class RegionActions
  constructor: ->
    @generateActions(
      'initData',
      'fetch'
    )

window.RegionActions = alt.createActions(RegionActions)

