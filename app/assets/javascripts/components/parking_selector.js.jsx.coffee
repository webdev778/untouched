@ParkingSelector = React.createClass

  VALUES: [ '1', '2', '3+' ]

  render: ->
    `<div className='sidebar__box'>
      <SidebarTitle value="Parking" />
      {this.renderCheckboxes()}
    </div>`

  renderCheckboxes: ->
    hasInitialValue = @hasInitialValue
    handleClick     = @handleClick
    getFacetCount   = @getFacetCount

    _.map @VALUES, (value) =>
      strippedValue = value.replace('+', '')
      `<CheckboxField 
        id={'parking'+strippedValue}
        key={value}
        checked={hasInitialValue(strippedValue)} 
        facetCount={getFacetCount(strippedValue)}
        value={strippedValue}
        label={value}
        onClick={handleClick} 
        name="parking" />`

  getFacetCount: (value) ->
    _.find(@props.facets, (pair) -> pair[0] == value)?[1]

  val: ->
    _.map $("input[name='parking']:checked"), (el) -> el.value

  hasInitialValue: (value) ->
    return false unless @props.filters?.parking
    _.includes @props.filters.parking, value

  handleClick: (event) ->
    @props.actions.filterData(parking: @val())



