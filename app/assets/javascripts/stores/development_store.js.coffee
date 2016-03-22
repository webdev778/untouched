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
    _.merge @filterParams, params

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

