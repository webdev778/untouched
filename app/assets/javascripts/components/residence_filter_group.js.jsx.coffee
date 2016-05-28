@ResidenceFilterGroup = React.createClass

  fields:
    kitchen_island: 'Kitchen island'
    study_nook: 'Study nook'
    storage_cage: 'Storage cage'
    ensuite: 'Ensuite'
    walk_in_wardrobe: 'Walk-in wardrobe'
    bathtub: 'Bathtub'
    penthouse_level: 'Penthouse level'
    no_stacker: 'No stacker'

  renderCheckboxes: ->
    handler = @handleClick
    hasInitialValue = @hasInitialValue
    getFacetCount   = @getFacetCount
    _.map @fields, (value, key) =>
      `<CheckboxField
        checked={hasInitialValue(key)}
        ref={key}
        key={key}
        id={key}
        value="true"
        facetCount={getFacetCount(key)}
        label={value}
        onClick={handler}
        name={'residence_' + key} />`

  render: ->
    `<div className='sidebar__box'>
      <SidebarTitle value="Residence" />
      {this.renderCheckboxes()}
    </div>`

  getFacetCount: (key) ->
    facet = @props.facets?[key]
    return 0 unless facet
    _.find(facet, (pair) -> pair[0] == true.toString())?[1]

  handleClick: (event) ->
    params = {}

    if $(event.target).is(':checked')
      params[event.target.id] = true
    else
      params[event.target.id] = undefined

    @props.actions.filterData(params)


  hasInitialValue: (key) ->
    !! @props.filters?[key]


