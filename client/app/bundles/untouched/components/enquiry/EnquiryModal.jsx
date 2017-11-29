import React, { Component } from 'react';

import EnquiryStore from '../../stores/enquiry_store';

import EnquiryFormSuccessModal from './EnquiryFormSuccessModal';
import EnquiryFormModal from './EnquiryFormModal';

export default class EnquiryModal extends Component {

  state = {
    enquiry: null
  }

  componentWillMount() {
    EnquiryStore.listen(this.onChange);
  }

  componentWillUnmount() {
    EnquiryStore.listen(this.onChange);
  }

  onChange = (state) => {
    this.setState(state);
  }

  style() {
    return {
      display: this.props.isOpen ? 'block' : 'none'
    };
  }

  render() {
    if (this.state.enquiry) {
      return <EnquiryFormSuccessModal unit={this.props.unit} onClose={this.props.onClose} isOpen={this.props.isOpen}/>;
    } else if (this.state.error) {
      return <EnquiryFormModal error={this.state.error} unit={this.props.unit} onClose={this.props.onClose} isOpen={this.props.isOpen}/>;
    } else {
      return <EnquiryFormModal unit={this.props.unit} onClose={this.props.onClose} isOpen={this.props.isOpen}/>;
    }
  }
}

