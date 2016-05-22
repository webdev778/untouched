browserHistory = require('react-router').browserHistory

module.exports = 
  push: (params) ->
    if (developmentId = params.development_id)
      routeParams = _.omit(params, 'development_id')
      browserHistory.push("/developments/#{developmentId}" + new RouteGenerator(routeParams).generate())
    else
      browserHistory.push(new RouteGenerator(params).generate())

