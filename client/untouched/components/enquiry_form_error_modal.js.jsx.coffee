@EnquiryFormErrorModal = React.createClass

  render: ->
    `<div className="enquiry-modal">
      <Modal onClose={this.props.onClose} isOpen={this.props.isOpen}>
        ERROR
      </Modal>
    </div>`

