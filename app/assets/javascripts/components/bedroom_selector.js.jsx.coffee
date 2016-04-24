@BedroomSelector = React.createClass

  render: ->
    `<div className='sidebar__box'>
      <SidebarTitle value="Bedrooms" />

      <CheckboxField 
        id="bedrooms1" 
        checked={this.hasInitialValue('1')} 
        value="1" 
        label="1" 
        onClick={this.handleClick} 
        name="bedrooms" />

      <CheckboxField 
        id="bedrooms2" 
        checked={this.hasInitialValue('2')} 
        value="2" 
        label="2" 
        onClick={this.handleClick} 
        name="bedrooms" />

      <CheckboxField 
        id="bedrooms3" 
        checked={this.hasInitialValue('3')} 
        value="3" 
        label="3" 
        onClick={this.handleClick} 
        name="bedrooms" />

      <CheckboxField 
        id="bedrooms4" 
        checked={this.hasInitialValue('4')} 
        value="4" 
        label="4+" 
        onClick={this.handleClick} 
        name="bedrooms" />

    </div>`

  hasInitialValue: (value) ->
    return false unless @props.filters?.bedrooms
    _.includes @props.filters.bedrooms, value

  val: ->
    _.map $("input[name='bedrooms']:checked"), (el) -> el.value

  handleClick: (event) ->
    @props.actions.filterData(bedrooms: @val())



