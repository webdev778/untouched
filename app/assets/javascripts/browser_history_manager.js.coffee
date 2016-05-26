browserHistory = require('react-router').browserHistory

module.exports =
  push: (params) ->
    if (developmentId = params.development_id)
      routeParams = _.omit(params, 'development_id')
      @_push("/developments/#{developmentId}" + new RouteGenerator(routeParams).generate())
    else
      @_push(new RouteGenerator(params).generate())

  _push: (path) ->
    if window.location.pathname != path
      browserHistory.push(path)
