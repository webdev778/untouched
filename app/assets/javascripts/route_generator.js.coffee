class RouteGenerator
  constructor: (params) ->
    @params = params

  @parseParam: (pair) ->
    [ name, value ] = pair
    paramType = DevelopmentStore.PARAM_TYPES[name]
    if paramType == 'array'
      [ name, value.split(',') ]
    else
      [ name, value ]


  @parse: (str) ->
    return {} unless str
    _.fromPairs(
      _.map(
        _.chunk(str.split('/'), 2),
        ((pair) =>
          @parseParam(pair)
        )
      )
    )

  generate: ->
    '/' + (_.map @params, (value, key) =>
      "#{key}/#{value}"
    ).join('/')

window.RouteGenerator = RouteGenerator

