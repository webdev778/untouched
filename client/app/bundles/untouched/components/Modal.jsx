import React, { Component } from 'react';

export default class Modal extends Component {

  style() {
    return {
      display: this.props.isOpen ? 'block' : 'none'
    };
  }

  render() {
    return (
      <div className="modal-wrapper">
        <div className="modal fade in" id="modal-enquire" aria-hidden="false" style={this.style()}>
          <div className="modal-dialog">
            <div className="modal-content">
              <button type="button" data-dismiss="modal" aria-label="Close" onClick={this.props.onClose} className="modal__close">×</button>
              {this.props.children}
            </div>
          </div>
        </div>
        <div className="modal-backdrop fade in" style={this.style()}></div>
      </div>
    );
  }
}

