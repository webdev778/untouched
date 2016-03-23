@BedroomSelector = React.createClass


  render: ->
    `<div className='sidebar__box'>
      <SidebarTitle value="Bedrooms" />
      <CheckboxField id="bedrooms1" value="1" label="1" onClick={this.handleClick} name="bedrooms" />
      <CheckboxField id="bedrooms2" value="2" label="2" onClick={this.handleClick} name="bedrooms" />
      <CheckboxField id="bedrooms3" value="3" label="3" onClick={this.handleClick} name="bedrooms" />
      <CheckboxField id="bedrooms4" value="4" label="4" onClick={this.handleClick} name="bedrooms" />
    </div>`

  val: ->
    _.map $("input[name='bedrooms']:checked"), (el) -> el.value

  handleClick: (event) ->
    console.log(@val())
    DevelopmentActions.filterData(bedrooms: @val())



