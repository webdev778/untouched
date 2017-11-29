import React, { Component } from 'react';

import Modal from '../Modal';

export default class EnquiryFormErrorModal extends Component {

  render() {
    return (
      <div className="enquiry-modal">
        <Modal onClose={this.props.onClose} isOpen={this.props.isOpen}>
          ERROR
        </Modal>
      </div>
    );
  }
}

