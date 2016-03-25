class RegionStore

  @displayName: 'RegionStore'

  constructor: ->
    @bindActions(RegionActions)
    @regions = []

    @exportPublicMethods(
      getRegions: @getRegions
    )

  onInitData: (props) ->
    @regions= props.regions

  fetch: ->
    $.ajax
      method: 'GET'
      url: '/api/regions'
      data: @filterParams
      success: (response) =>
        @regions = response.regions
        @emitChange()
      error: (response) ->
        console.log 'error'
        console.log response

  getRegions: ->
    @getState().regions

 window.RegionStore = alt.createStore(RegionStore)

