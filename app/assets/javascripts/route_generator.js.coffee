class RouteGenerator
  constructor: (params) ->
    @params = params

  @parseParam: (pair) ->
    [ name, value ] = pair
    paramType = Schema[name]
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
      if value.length > 0
        "#{key}/#{value}"
    ).join('/')

window.RouteGenerator = RouteGenerator

