class EnquiryStore

  constructor: ->
    @bindListeners(
      handleSubmitEnquiry: EnquiryActions.SUBMIT_ENQUIRY
      handleUpdateEnquiry: EnquiryActions.UPDATE_ENQUIRY
      handleSubmitEnquiryFailed: EnquiryActions.SUBMIT_ENQUIRY_FAILED
    )

  handleSubmitEnquiry: (args...) ->
    @

  handleUpdateEnquiry: (enquiry) ->
    @enquiry = enquiry

  handleSubmitEnquiryFailed: (error) ->
    @error = error

window.EnquiryStore = alt.createStore(EnquiryStore)

