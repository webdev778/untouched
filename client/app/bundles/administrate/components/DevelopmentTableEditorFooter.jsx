import React, { Component } from 'react';

import UnitActions from '../actions/unit_actions';

export default class DevelopmentTableEditorFooter extends Component {

  renderEditors() {
    return _.map(this.props.columns, column => {
      switch (column.type) {
        case 'input':
          return this.renderInputEditor(column);
        case 'dropdown':
          return this.renderDropdownEditor(column);
        case 'boolean':
          return this.renderBooleanEditor(column);
        case 'images':
          return <td key={column.property}>&nbsp;</td>;
      }
    });
  }


  renderInputEditor(column) {
    return (
      <td key={column.property}>
        <input type="text" ref={column.property}/>
      </td>
    );
  }

  renderDropdownEditor(column) {
    return (
      <td key={column.property}>
        <select ref={column.property}>
          {this.renderDropdownOptions(column)}
        </select>
      </td>
    );
  }

  renderDropdownOptions(column) {
    const prop = this.props.properties[column.property];
    return _.map(prop.options, option => (
      <option key={option.value} value={option.value}>{option.name}</option>
    ));
  }

  renderBooleanEditor(column) {
    return (
      <td key={column.property}>
        <input type="checkbox" value="true" ref={column.property}/>
      </td>
    );
  }

  render() {
    return (
      <tfoot>
        <tr>
          {this.renderEditors()}
          <td>
            <input onClick={this.handleSubmit} type="submit" value="Add Unit"/>
          </td>
        </tr>
      </tfoot>
    );
  }

  submitParams() {
    return _.reduce(this.props.columns, (acc, column) => {
      let h = {};

      switch (column.type) {
        case 'boolean':
          h[column.property] = this.refs[column.property].checked;
          break;
        case 'input':
          h[column.property] = this.refs[column.property].value;
          break;
        case 'dropdown':
          h[column.property] = this.refs[column.property].value;
          break;
      }

      return _.assign(acc, h);
    }, { development_id: this.props.development.id });
  }


  handleSubmit = (event) => {
    UnitActions.createUnit(this.submitParams());

    // clear current row
    _.each(this.props.columns, (column) => {
      if (column.property === 'number') {
        const number = parseInt(this.refs['number'].value);
        if (number) {
          this.refs['number'].value = number + 1;
        }
      } else {
        switch (column.type) {
          case 'boolean':
            this.refs[column.property].checked = false;
            break;
          case 'input':
            this.refs[column.property].value = '';
            break;
        }
      }
    });

    
  }
}

