class DevelopmentStore

  @displayName: 'DevelopmentStore'

  DEFAULT_FILTER_PARAMS:
    sort: 'price'
    sort_order: 'asc'
    
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

    # We really shouldn't do this here...
    ReactRouter.browserHistory.push(new RouteGenerator(@filterParams).generate())

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
        @emitChange()
      error: (response) ->
        console.log 'error'
        console.log response

  getDevelopments: ->
    @getState().developments

 window.DevelopmentStore = alt.createStore(DevelopmentStore)

