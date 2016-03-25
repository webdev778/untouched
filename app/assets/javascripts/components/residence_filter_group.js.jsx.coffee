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
    _.map @fields, (value, key) =>
      `<CheckboxField key={key} id={key} value="true" label={value} onClick={handler} name={'residence_' + key} />`

  render: ->
    `<div className='sidebar__box'>
      <SidebarTitle value="Residence" />
      {this.renderCheckboxes()}
    </div>`

  handleClick: (event) ->
    params = {}

    if $(event.target).is(':checked')
      params[event.target.id] = true
    else
      params[event.target.id] = undefined

    DevelopmentActions.filterData(params)



