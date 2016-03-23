@BathroomSelector = React.createClass

  render: ->
    `<div className='sidebar__box'>
      <SidebarTitle value="Bathrooms" />
      <CheckboxField id="bathrooms1" value="1" label="1" onClick={this.handleClick} name="bathrooms" />
      <CheckboxField id="bathrooms2" value="2" label="2" onClick={this.handleClick} name="bathrooms" />
      <CheckboxField id="bathrooms3" value="3" label="3+" onClick={this.handleClick} name="bathrooms" />
    </div>`

  val: ->
    _.map $("input[name='bathrooms']:checked"), (el) -> el.value

  handleClick: (event) ->
    DevelopmentActions.filterData(bathrooms: @val())



