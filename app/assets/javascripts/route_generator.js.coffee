class RouteGenerator
  constructor: (params) ->
    @params = params

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

