@AspectSelector = React.createClass

  render: ->
    `<div className='sidebar__box'>
      <SidebarTitle value="Aspect" />
      <CheckboxField id="aspect_north" value="north" label="North" onClick={this.handleClick} name="aspect" />
      <CheckboxField id="aspect_east" value="east" label="East" onClick={this.handleClick} name="aspect" />
      <CheckboxField id="aspect_south" value="south" label="South" onClick={this.handleClick} name="aspect" />
      <CheckboxField id="aspect_west" value="west" label="West" onClick={this.handleClick} name="aspect" />
    </div>`

  val: ->
    _.map $("input[name='aspect']:checked"), (el) -> el.value

  handleClick: (event) ->
    DevelopmentActions.filterData(aspect: @val())



