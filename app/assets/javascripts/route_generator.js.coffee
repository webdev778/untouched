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


  @parse: (str, prefix) ->
    return {} unless str

    if prefix
      str = str.replace(prefix, '')

    _.fromPairs(
      _.map(
        _.chunk(str.split('/'), 2),
        ((pair) =>
          @parseParam(pair)
        )
      )
    )

  generate: ->
    '/' + _.chain(@params).map((value, key) =>
      if value.length > 0
        "#{key}/#{value}"
    ).compact().value().join('/')

window.RouteGenerator = RouteGenerator

