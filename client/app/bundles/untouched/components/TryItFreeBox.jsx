import React, { Component } from 'react';

import TryItFreeActions from '../actions/try_it_free_actions';

import Modal from './Modal';

export default class TryItFreeBox extends Component {

  state = {
    isModalOpen : false,
    submitDisabled: true,
    error: null
  }

  render() {
    return (
      <div className="try-it-free-section alert-modal">
        <div className="form__group form__group--inline1">
          <input type="email" onInput={this.toggleSubmit} ref="email" placeholder="Your work email" className="form__control"/>
          <button type="submit" disabled={this.state.submitDisabled} onClick={this.onSubmit} className="btn btn--alt">Try it free</button>
        </div>
        {this.renderError()}
        <Modal onClose={this.onCloseModal} isOpen={this.state.isModalOpen} className="alert-modal">
          <p>Thank you for your interest of Untouched.<br/>
          We have received your message and will respond within 48 hours.</p>
          <fieldset className="form__group">
            <button type="button" onClick={this.onCloseModal} className="btn btn--primary btn--lg">Dismiss</button>
          </fieldset>
        </Modal>
      </div>
    );
  }

  renderError() {
    if (!this.state.error) { return null; }
    return <div className="form__error">Oops! Enter a valid email.</div>;
  }

  allowSubmission() {
    return _.every([ 'email' ], key => {
      const emailPattern = /(.+)@(.+){2,}\.(.+){2,}/;
      if (!emailPattern.test(this.refs[key].value)) {
        return false;
      }
      return true;
    });
  }

  toggleSubmit = (event) => {
    return this.setState({submitDisabled: !this.allowSubmission(), error: !this.allowSubmission()});
  }

  onSubmit = (event) => {
    event.preventDefault();

    TryItFreeActions.submitEmail({
      email: this.refs.email.value,
    });

    this.setState({isModalOpen: true});
    return false;
  }

  onCloseModal = () => {
    return this.setState({isModalOpen: false});
  }
}
