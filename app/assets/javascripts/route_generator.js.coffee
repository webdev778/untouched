class RouteGenerator
  constructor: (params) ->
    @params = params

  PARAM_ORDER: [ 
    'city'
    'region'
    'suburb'
    'max_price'
    'bedrooms'
    'bathrooms'
    'parking'
    'internal_in_meters'
    'master_bedroom_in_meters'
    'external_in_meters'
    'aspect'
    'kitchen_island'
    'study_nook'
    'storage_cage'
    'ensuite'
    'walk_in_wardrobe'
    'bathtub'
    'penthouse_level'
    'no_stacker'
    'max_body_corporate_fee'
    'gym'
    'pool'
    'spa'
    'sauna'
    'steam_room'
    'rooftop_deck'
    'ceiling_height_at_living_area_in_meters'
    'units_count'
    'development_type'
    'ready_at'
  ]

  interpolatedRouterString: ->
    '/' + (_.map @PARAM_ORDER, (name) =>
      "#{name}/:#{name}"
    ).join('/')

  @parse: (str) ->
    return {} unless str
    _.fromPairs(
      _.chunk(str.split('/'), 2)
    )

  generate: ->
    '/' + (_.map @params, (value, key) =>
      "#{key}/#{value}"
    ).join('/')

window.RouteGenerator = RouteGenerator

