@RegionSelector = React.createClass

  renderOptions: ->
    _.map @props.regions, (region) =>
      `<option key={region.name} value={region.id}>{region.name}</option>`

  renderSuburbSelectors: ->
    return unless @state?.suburbs
    handler = @handleChangeSuburb
    _.map @state.suburbs, (suburb) ->
      `<CheckboxField id={'suburb'+suburb.id} key={suburb.id} value={suburb.id} label={suburb.name} onClick={handler} name="suburb" />`

  renderSuburbTitle: ->
    return unless @state?.suburbs
    `<SidebarTitle value='Suburb' />`

  defaultValue: ->
    @props.filters?.region

  render: ->
    `<div className='form__group'>
      <select value={this.defaultValue()} id='region_selector' className='select' onChange={this.handleChangeRegion}>
        <option key='any' value=''>{'All Regions (' + this.props.regions.length + ')'}</option>
        {this.renderOptions()}
      </select>

      {this.renderSuburbTitle()}
      {this.renderSuburbSelectors()}
    </div>`

  regionVal: ->
    $('select#region_selector').val()

  suburbVal: ->
    _.map $("input[name='suburb']:checked"), (el) -> el.value

  handleChangeRegion: ->
    DevelopmentActions.filterData(region: @regionVal(), suburb: [])
    region = _.find @props.regions, (r) => r.id == parseInt(@regionVal())
    @setState(suburbs: region.suburbs)

  handleChangeSuburb: ->
    DevelopmentActions.filterData(suburb: @suburbVal())
