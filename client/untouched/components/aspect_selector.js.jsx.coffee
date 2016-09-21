@AspectSelector = React.createClass

  VALUES: [ 'North', 'East', 'South', 'West' ]

  render: ->
    `<div className='sidebar__box'>
      <SidebarTitle value="Aspect" />
      {this.renderCheckboxes()}
    </div>`

  renderCheckboxes: ->
    hasInitialValue = @hasInitialValue
    handleClick     = @handleClick
    getFacetCount   = @getFacetCount

    _.map @VALUES, (value) =>
      strippedValue = _.toLower(value)
      `<CheckboxField 
        id={'aspect_'+strippedValue}
        key={value}
        checked={hasInitialValue(strippedValue)} 
        facetCount={getFacetCount(strippedValue)}
        value={strippedValue}
        label={value}
        onClick={handleClick} 
        name="aspect" />`

  getFacetCount: (value) ->
    _.find(@props.facets, (pair) -> pair[0] == value)?[1]

  hasInitialValue: (value) ->
    return false unless @props.filters?.aspect
    _.includes @props.filters.aspect, value

  val: ->
    _.map $("input[name='aspect']:checked"), (el) -> el.value

  handleClick: (event) ->
    @props.actions.filterData(aspect: @val())



