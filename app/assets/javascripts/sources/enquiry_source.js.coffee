axios = require('axios')

class EnquirySource

  @create: (params) ->
    axios.post('/api/enquiries', enquiry: params)


window.EnquirySource = EnquirySource
