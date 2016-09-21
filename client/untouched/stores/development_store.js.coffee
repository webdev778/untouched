BrowserHistoryManager = require('./../browser_history_manager.js.coffee')

class DevelopmentStore

  @displayName: 'DevelopmentStore'

  DEFAULT_FILTER_PARAMS:
    sort: 'price'
    sort_order: 'desc'

  constructor: ->
    @bindActions(DevelopmentActions)
    @developments = []
    @filterParams = @DEFAULT_FILTER_PARAMS

    @exportPublicMethods(
      getDevelopments: @getDevelopments
    )

  onInitData: (props) ->
    @developments = props.developments

  onFilterData: (params) ->
    _.assign @filterParams, params

    BrowserHistoryManager.push(@filterParams)

    @fetch()

  onSelect: (id) ->
    $.ajax
      method: 'GET'
      url: '/api/developments/' + id
      success: (response) =>
        @development = response.development
        @emitChange()
      error: (response) ->
        console.log 'error'
        console.log response

  fetch: ->
    $.ajax
      method: 'GET'
      url: '/api/developments'
      data: @filterParams
      success: (response) =>
        @developments = response.developments
        @facets = response.facets
        @emitChange()
      error: (response) ->
        console.log 'error'
        console.log response

  getDevelopments: ->
    @getState().developments

 window.DevelopmentStore = alt.createStore(DevelopmentStore)

