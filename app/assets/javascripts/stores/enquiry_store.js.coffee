class EnquiryStore

  constructor: ->
    @bindListeners(
      handleSubmitEnquiry: EnquiryActions.SUBMIT_ENQUIRY
    )

  handleSubmitEnquiry: (args...) ->
    @

window.EnquiryStore = alt.createStore(EnquiryStore)

