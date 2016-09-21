axios = require('axios')
getCSRFToken = require('../get_csrf_token')
axios.defaults.headers['X-CSRF-Token'] = getCSRFToken()

class EnquirySource

  @create: (params) ->
    axios.post('/api/enquiries', enquiry: params)


window.EnquirySource = EnquirySource
