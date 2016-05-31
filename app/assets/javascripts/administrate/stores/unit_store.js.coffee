class UnitStore

  @displayName: 'UnitStore'

  DEFAULT_FILTER_PARAMS:
    status: 'any'
    sort: 'number'
    sort_order: 'asc'

  constructor: ->
    @bindActions(UnitActions)
    @units        = []
    @filterParams = @DEFAULT_FILTER_PARAMS

    @exportPublicMethods(
      getUnits: @getUnits
    )

  onInitData: (props) ->
    @units = props.units

  onFilterData: (params) ->
    _.assign @filterParams, params
    @fetch()

  onUpdateUnit: (args) ->
    [ id, params ] = args
    $.ajax
      method: 'PUT'
      url: '/api/units/' + id
      data:
        unit: params
      success: (response) =>
        idx = _.findIndex(@units, { id: id })
        @units[idx] = response.unit
        @emitChange()
      error: (response) =>
        alert("Oops! Something went wrong. Check your data and try again.")

  onCreateUnit: (params) ->
    $.ajax
      method: 'POST'
      url: '/api/units'
      data:
        unit: params
      success: (response) =>
        @units.push(response.unit)
        @emitChange()
      error: (response) =>
        alert("Oops! Something went wrong. Check your data and try again.")

  onDeleteUnit: (id) ->
    $.ajax
      method: 'DELETE'
      url: '/api/units/'+id
      success: (response) =>
        @units = _.reject(@units, (u) -> u.id == parseInt(id))
        @emitChange()
      error: (response) =>
        alert("Oops! Something went wrong. Please try again.")

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

