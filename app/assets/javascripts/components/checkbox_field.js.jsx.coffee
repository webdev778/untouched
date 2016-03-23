@CheckboxField = React.createClass
  render: ->
    `<div className="form__group">
      <input type="checkbox" name={this.props.name} id={this.props.id} value={this.props.value} onClick={this.props.onClick} />
      <label htmlFor={this.props.id}>{this.props.label}</label>
    </div>`

