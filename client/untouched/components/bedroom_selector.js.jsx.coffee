@BedroomSelector = React.createClass

  VALUES: [ '1', '2', '3', '4+' ]

  render: ->
    `<div className='sidebar__box'>
      <SidebarTitle value="Bedrooms" />
      {this.renderCheckboxes()}
    </div>`

  renderCheckboxes: ->
    hasInitialValue = @hasInitialValue
    handleClick     = @handleClick
    getFacetCount   = @getFacetCount

    _.map @VALUES, (value) =>
      strippedValue = value.replace('+', '')
      `<CheckboxField 
        id={'bedrooms'+strippedValue}
        key={value}
        checked={hasInitialValue(strippedValue)} 
        facetCount={getFacetCount(strippedValue)}
        value={strippedValue}
        label={value}
        onClick={handleClick} 
        name="bedrooms" />`

  getFacetCount: (value) ->
    _.find(@props.facets, (pair) -> pair[0] == value)?[1]

  hasInitialValue: (value) ->
    return false unless @props.filters?.bedrooms
    _.includes @props.filters.bedrooms, value

  val: ->
    _.map $("input[name='bedrooms']:checked"), (el) -> el.value

  handleClick: (event) ->
    @props.actions.filterData(bedrooms: @val())



