@EnquiryFormModal = React.createClass

  render: ->
    `<div className="enquiry-modal">
      <Modal onClose={this.props.onClose} isOpen={this.props.isOpen}>
        <form action="#" className="enquiry">
          <fieldset className="form__group form__group--inline">
            <input type="text" onInput={this.toggleSubmit} ref="name" placeholder="Name" className="form__control"/>
          </fieldset>
          <fieldset className="form__group form__group--inline">
            <input type="email" onInput={this.toggleSubmit} ref="email" placeholder="Email" className="form__control"/>
          </fieldset>
          <fieldset className="form__group">
            <textarea ref="body" onInput={this.toggleSubmit} placeholder="Enter your question / comment..." className="form__control"></textarea>
          </fieldset>
          <fieldset className="form__group">
            <input ref="mortgage" type="checkbox" id="mortgage"/>
            <label htmlFor="mortgage">Yes, I also want UNTOUCHED to find me the best mortgage.</label>
          </fieldset>
          <fieldset className="form__group">
            <button type="submit" disabled={this.state.submitDisabled} onClick={this.onSubmit} className="btn btn--primary btn--lg">Send Email to Sales</button>
            {this.renderError()}
          </fieldset>
        </form>
      </Modal>
    </div>`

  renderError: ->
    return null unless @props.error
    `<div className="form__error">Oops! There was a problem. Please try again.</div>`

  getInitialState: ->
    {
      submitDisabled: true
    }

  allowSubmission: ->
    _.every [ 'name', 'email', 'body' ], (key) =>
      @refs[key].value.length > 0

  toggleSubmit: (event) ->
    @setState(submitDisabled: !@allowSubmission())

  onSubmit: (event) ->
    event.preventDefault()

    EnquiryActions.submitEnquiry(
      name: @refs.name.value
      email: @refs.email.value
      body: @refs.body.value
      mortgage: @refs.mortgage.value
      unit_id: @props.unit.id
    )

    return false
