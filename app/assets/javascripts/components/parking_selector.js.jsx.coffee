@ParkingSelector = React.createClass

  render: ->
    `<div className='sidebar__box'>
      <SidebarTitle value="Parking" />
      <CheckboxField 
        checked={this.hasInitialValue('0')}
        id="parking0" 
        value="0" 
        label="0" 
        onClick={this.handleClick} 
        name="parking" />

      <CheckboxField 
        checked={this.hasInitialValue('1')}
        id="parking1" 
        value="1" 
        label="1" 
        onClick={this.handleClick} 
        name="parking" />

      <CheckboxField 
        checked={this.hasInitialValue('2')}
        id="parking2" 
        value="2" 
        label="2" 
        onClick={this.handleClick} 
        name="parking" />

      <CheckboxField 
        checked={this.hasInitialValue('3')}
        id="parking3" 
        value="3" 
        label="3+" 
        onClick={this.handleClick} 
        name="parking" />
    </div>`

  val: ->
    _.map $("input[name='parking']:checked"), (el) -> el.value

  hasInitialValue: (value) ->
    return false unless @props.filters?.parking
    _.includes @props.filters.parking, value

  handleClick: (event) ->
    @props.actions.filterData(parking: @val())



