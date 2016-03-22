class DevelopmentStore

  constructor: (data) ->
    @data = data

  filter: (params) ->
    $.ajax
      method: 'GET'
      path: '/api/search'

