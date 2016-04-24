@BuildingFilterGroup = React.createClass

  fields:
    gym: 'Gym'
    pool: 'Pool'
    spa: 'Spa'
    sauna: 'Sauna'
    steam_room: 'Steam room'
    rooftop_deck: 'Rooftop deck'

  renderCheckboxes: ->
    handler = @handleClick
    hasInitialValue = @hasInitialValue
    _.map @fields, (value, key) =>
      `<CheckboxField 
        checked={hasInitialValue(key)}
        key={key} 
        id={key} 
        value="true" 
        label={value} 
        onClick={handler} 
        name={'building_' + key} />`

  render: ->
    `<div className='sidebar__box'>
      <SidebarTitle value="Building" />
      {this.renderCheckboxes()}
    </div>`

  handleClick: (event) ->
    params = {}

    if $(event.target).is(':checked')
      params[event.target.id] = true
    else
      params[event.target.id] = undefined

    @props.actions.filterData(params)

  hasInitialValue: (key) ->
    !! @props.filters?[key]



