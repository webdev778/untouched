class UnitStore

  @displayName: 'UnitStore'

  DEFAULT_FILTER_PARAMS:
    sort: 'price'
    sort_order: 'asc'
    
  constructor: ->
    @bindActions(UnitActions)
    @units = []
    @filterParams = @DEFAULT_FILTER_PARAMS

    @exportPublicMethods(
      getUnits: @getUnits
    )

  onInitData: (props) ->
    @units = props.units

  onFilterData: (params) ->
    _.assign @filterParams, params
    @fetch()

  onSelect: (args) ->
    $.ajax
      method: 'GET'
      url: '/api/developments/' + args[0] + '/units/' + args[1]
      success: (response) =>
        @unit = response.unit
        @emitChange()
      error: (response) ->
        console.log 'error'
        console.log response

  fetch: ->
    $.ajax
      method: 'GET'
      url: '/api/units'
      data: @filterParams
      success: (response) =>
        @units = response.units
        @emitChange()
      error: (response) ->
        console.log 'error'
        console.log response

  getUnits: ->
    @getState().units

 window.UnitStore = alt.createStore(UnitStore)

