import React, { Component } from 'react';
import { Link } from 'react-router';

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
          <button type="submit" onClick={this.onSubmit} className="btn btn--alt">Try it free</button>
        </div>
        {this.renderError()}
        <Modal onClose={this.onCloseModal} isOpen={this.state.isModalOpen} className="alert-modal">
          <p>
            Thanks for that. I'll be in touch within the next couple of hours to help setup your free trial.
          </p>
          <p>
            Sasha Gilberg, Founder, UNTOUCHED.
          </p>
          <fieldset className="form__group">
            {this.renderBottomButton()}
          </fieldset>
        </Modal>
      </div>
    );
  }

  renderError() {
    if (!this.state.error) { return null; }
    return <div className="form__error">Oops! Enter a valid email.</div>;
  }

  renderBottomButton() {
    if (this.props.location == "landing") {
      return <Link to="/how_it_works" className="btn btn--primary btn--lg">SEE HOW IT WORKS</Link>
    }
    else {
      return <button type="button" onClick={this.onCloseModal} className="btn btn--primary btn--lg">Done</button>
    }
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
    return this.setState({submitDisabled: !this.allowSubmission(), error: false});
  }

  onSubmit = (event) => {
    event.preventDefault();
    if(!this.state.submitDisabled) {
      TryItFreeActions.submitEmail({
        email: this.refs.email.value,
      });

      this.setState({isModalOpen: true});
      return false;
    }
    else {
      this.setState({error: true});
    }
  }

  onCloseModal = () => {
    return this.setState({isModalOpen: false});
  }
}
