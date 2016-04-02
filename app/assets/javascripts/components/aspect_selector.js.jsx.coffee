@AspectSelector = React.createClass

  render: ->
    `<div className='sidebar__box'>
      <SidebarTitle value="Aspect" />

      <CheckboxField 
        id="aspect_north" 
        checked={this.hasInitialValue('north')} 
        value="north" 
        label="North" 
        onClick={this.handleClick} 
        name="aspect" />

      <CheckboxField 
        id="aspect_east" 
        checked={this.hasInitialValue('east')} 
        value="east" 
        label="East" 
        onClick={this.handleClick} 
        name="aspect" />

      <CheckboxField 
        id="aspect_south" 
        checked={this.hasInitialValue('south')} 
        value="south" 
        label="South" 
        onClick={this.handleClick} 
        name="aspect" />

      <CheckboxField 
        id="aspect_west" 
        checked={this.hasInitialValue('west')} 
        value="west" 
        label="West" 
        onClick={this.handleClick} 
        name="aspect" />
    </div>`

  hasInitialValue: (value) ->
    return false unless @props.filters?.aspect
    _.includes @props.filters.aspect, value

  val: ->
    _.map $("input[name='aspect']:checked"), (el) -> el.value

  handleClick: (event) ->
    DevelopmentActions.filterData(aspect: @val())



