@CheckboxField = React.createClass
  render: ->
    `<div className="form__group">
      <input 
        type="checkbox" 
        defaultChecked={this.props.checked} 
        name={this.props.name} 
        id={this.props.id} 
        value={this.props.value}
        onClick={this.props.onClick} />

      <label htmlFor={this.props.id}>{this.generateLabel()}</label>
    </div>`

  generateLabel: ->
    "#{@props.label} (#{@props.facetCount || 0})"
