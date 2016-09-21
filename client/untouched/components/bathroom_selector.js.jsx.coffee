@BathroomSelector = React.createClass

  VALUES: [ '1', '2', '3+' ]

  render: ->
    `<div className='sidebar__box'>
      <SidebarTitle value="Bathrooms" />
      {this.renderCheckboxes()}
    </div>`

  renderCheckboxes: ->
    hasInitialValue = @hasInitialValue
    handleClick     = @handleClick
    getFacetCount   = @getFacetCount

    _.map @VALUES, (value) =>
      strippedValue = value.replace('+', '')
      `<CheckboxField 
        id={'bathrooms'+strippedValue}
        key={value}
        checked={hasInitialValue(strippedValue)} 
        facetCount={getFacetCount(strippedValue)}
        value={strippedValue}
        label={value}
        onClick={handleClick} 
        name="bathrooms" />`

  hasInitialValue: (value) ->
    return false unless @props.filters?.bathrooms
    _.includes @props.filters.bathrooms, value

  getFacetCount: (value) ->
    _.find(@props.facets, (pair) -> pair[0] == value)?[1]

  val: ->
    _.map $("input[name='bathrooms']:checked"), (el) -> el.value

  handleClick: (event) ->
    @props.actions.filterData(bathrooms: @val())



