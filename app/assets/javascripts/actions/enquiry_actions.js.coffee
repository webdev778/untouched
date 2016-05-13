class EnquiryActions
  submitEnquiry: (params) ->
    EnquirySource.
      create(params).
      then((response) => @updateEnquiry(response.data)).
      catch((error) => @submitEnquiryFailed(error))

  updateEnquiry: (enquiry) ->
    enquiry

  submitEnquiryFailed: (error) ->
    error

window.EnquiryActions = alt.createActions(EnquiryActions)

