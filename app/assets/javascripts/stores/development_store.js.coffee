class DevelopmentStore

  @displayName: 'DevelopmentStore'


  @PARAM_TYPES:
    city: 'string'
    region: 'string'
    suburb: 'array'
    max_price: 'number'
    bedrooms: 'array'
    bathrooms: 'array'
    parking: 'array'
    internal_in_meters: 'number'
    master_bedroom_in_meters: 'number'
    external_in_meters: 'number'
    aspect: 'array'
    kitchen_island: 'boolean'
    study_nook: 'boolean'
    storage_cage: 'boolean'
    ensuite: 'boolean'
    walk_in_wardrobe: 'boolean'
    bathtub: 'boolean'
    penthouse_level: 'boolean'
    no_stacker: 'boolean'
    max_body_corporate_fee: 'number'
    gym: 'boolean'
    pool: 'boolean'
    spa: 'boolean'
    sauna: 'boolean'
    steam_room: 'boolean'
    rooftop_deck: 'boolean'
    ceiling_height_at_living_area_in_meters: 'number'
    units_count: 'number'
    development_type: 'array'
    ready_at: 'date'

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

