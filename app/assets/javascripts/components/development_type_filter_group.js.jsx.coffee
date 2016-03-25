@DevelopmentTypeFilterGroup = React.createClass

  fields:
    apartment: 'Apartment'
    townhouse: 'Townhouse'

  renderCheckboxes: ->
    handler = @handleClick
    _.map @fields, (value, key) =>
      `<CheckboxField key={key} id={key} value={key} label={value} onClick={handler} name='development_type' />`

  render: ->
    `<div className='sidebar__box'>
      <SidebarTitle value="Type" />
      {this.renderCheckboxes()}
    </div>`

  val: ->
    _.map $("input[name='development_type']:checked"), (el) -> el.value

  handleClick: (event) ->
    DevelopmentActions.filterData(development_type: @val())



