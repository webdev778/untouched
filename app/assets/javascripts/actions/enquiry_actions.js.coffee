class EnquiryActions
  submitEnquiry: (params) ->
    $.ajax
      method: 'POST'
      url: '/api/enquiries'
      data:
        enquiry: params
      success: (response) ->
        p response
      error: (response) ->
        p response

    @

window.EnquiryActions = alt.createActions(EnquiryActions)

