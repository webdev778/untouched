class DevelopmentStore

  @displayName: 'DevelopmentStore'

  constructor: ->
    @bindActions(DevelopmentActions)
    @developments = []
    @filterParams = {}

    @exportPublicMethods(
      getDevelopments: @getDevelopments
    )

  onInitData: (props) ->
    @developments = props.developments

  onFilterData: (params) ->
    _.assign @filterParams, params
    @fetch()

  fetch: ->
    $.ajax
      method: 'GET'
      url: '/api/developments'
      data: @filterParams
      success: (response) =>
        # We really shouldn't do this here...
        ReactRouter.hashHistory.push(new RouteGenerator(response.filters).generate())

        @developments = response.developments
        @emitChange()
      error: (response) ->
        console.log 'error'
        console.log response

  getDevelopments: ->
    @getState().developments

 window.DevelopmentStore = alt.createStore(DevelopmentStore)

