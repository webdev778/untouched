@EnquiryFormSuccessModal = React.createClass

  render: ->
    `<div className="enquiry-modal alert-modal">
      <Modal onClose={this.props.onClose} isOpen={this.props.isOpen}>
        <p>Thank you for your interest in {this.props.unit.development.address}.<br/>
        We have received your message and will respond within 48 hours.</p>
        <fieldset className="form__group">
          <button onClick={this.props.onClose} className="btn btn--primary btn--lg">Dismiss</button>
        </fieldset>
      </Modal>
    </div>`

