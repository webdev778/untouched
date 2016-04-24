@BathroomSelector = React.createClass

  render: ->
    `<div className='sidebar__box'>
      <SidebarTitle value="Bathrooms" />
      <CheckboxField id="bathrooms1" 
        value="1" 
        checked={this.hasInitialValue('1')} 
        label="1" 
        onClick={this.handleClick} 
        name="bathrooms" />

      <CheckboxField 
        id="bathrooms2" 
        value="2" 
        checked={this.hasInitialValue('2')} 
        label="2" 
        onClick={this.handleClick} 
        name="bathrooms" />

      <CheckboxField 
        id="bathrooms3" 
        value="3" 
        label="3+" 
        checked={this.hasInitialValue('3')}
        onClick={this.handleClick} 
        name="bathrooms" />
    </div>`

  hasInitialValue: (value) ->
    return false unless @props.filters?.bathrooms
    _.includes @props.filters.bathrooms, value

  val: ->
    _.map $("input[name='bathrooms']:checked"), (el) -> el.value

  handleClick: (event) ->
    @props.actions.filterData(bathrooms: @val())



