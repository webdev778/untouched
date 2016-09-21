import React, { Component } from 'react';

export default class CheckboxField extends Component {

  render() {
    return (
      <div className="form__group">
        <input
          type="checkbox"
          defaultChecked={this.props.checked}
          name={this.props.name}
          id={this.props.id}
          value={this.props.value}
          ref="input"
          onClick={this.props.onClick} />

        <label htmlFor={this.props.id}>{this.generateLabel()}</label>
      </div>
    );
  }

  generateLabel() {
    return `${this.props.label} (${this.props.facetCount || 0})`;
  }

  isChecked() {
    return this.refs.input.checked;
  }

}
