@ParkingSelector = React.createClass

  render: ->
    `<div className='sidebar__box'>
      <SidebarTitle value="Parking" />
      <CheckboxField id="parking0" value="0" label="0" onClick={this.handleClick} name="parking" />
      <CheckboxField id="parking1" value="1" label="1" onClick={this.handleClick} name="parking" />
      <CheckboxField id="parking2" value="2" label="2" onClick={this.handleClick} name="parking" />
      <CheckboxField id="parking3" value="3" label="3+" onClick={this.handleClick} name="parking" />
    </div>`

  val: ->
    _.map $("input[name='parking']:checked"), (el) -> el.value

  handleClick: (event) ->
    DevelopmentActions.filterData(parking: @val())



