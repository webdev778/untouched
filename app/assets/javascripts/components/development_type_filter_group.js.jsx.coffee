@DevelopmentTypeFilterGroup = React.createClass

  fields:
    apartment: 'Apartment'
    townhouse: 'Townhouse'

  renderCheckboxes: ->
    handler = @handleClick
    hasInitialValue = @hasInitialValue
    getFacetCount   = @getFacetCount

    _.map @fields, (value, key) =>
      `<CheckboxField 
        checked={hasInitialValue(key)}
        key={key} 
        id={key} 
        value={key} 
        facetCount={getFacetCount(key)}
        label={value} 
        onClick={handler} 
        name='development_type' />`

  getFacetCount: (key) ->
    _.find(@props.facets, (pair) -> pair[0] == key)?[1]

  render: ->
    `<div className='sidebar__box'>
      <SidebarTitle value="Type" />
      {this.renderCheckboxes()}
    </div>`

  val: ->
    _.map $("input[name='development_type']:checked"), (el) -> el.value

  handleClick: (event) ->
    @props.actions.filterData(development_type: @val())

  hasInitialValue: (key) ->
    _.includes @props.filters?.development_type, key



