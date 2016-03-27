@RegionSelector = React.createClass

  renderOptions: ->
    currentValue = this.props.filters.region
    _.map @props.regions, (region) =>
      `<option key={region.name} value={region.id}>{region.name}</option>`

  renderSuburbSelectors: ->
    return unless @state?.suburbs
    _.map @state.suburbs, (suburb) =>
      `<CheckboxField value={suburb.id} key={suburb.id} label={suburb.name} onClick={this.handleChange} name="suburb" />`

  renderSuburbTitle: ->
    return unless @state?.suburbs
    `<SidebarTitle value='Suburb' />`

  defaultValue: ->
    @props.params?.region

  render: ->
    `<div className='form__group'>
      <select defaultValue={this.defaultValue()} id='region_selector' className='select' onChange={this.handleChange}>
        <option key='any' value=''>{'All Regions (' + this.props.regions.length + ')'}</option>
        {this.renderOptions()}
      </select>

      {this.renderSuburbTitle()}
      {this.renderSuburbSelectors()}
    </div>`

  val: ->
    $('select#region_selector').val()

  handleChange: ->
    DevelopmentActions.filterData(region: @val())
    region = _.find @props.regions, (r) => r.id == parseInt(@val())
    @setState(suburbs: region.suburbs)

