@RegionSelector = React.createClass

  renderOptions: ->
    currentValue = this.props.filters.region
    _.map @props.regions, (region) =>
      `<option key={region.name} value={region.name}>{region.name}</option>`

  defaultValue: ->
    @props.params?.region

  render: ->
    `<div className='form__group'>
      <select defaultValue={this.defaultValue()} id='region_selector' className='select' onChange={this.handleChange}>
        <option key='any' value=''>{'All Regions (' + this.props.regions.length + ')'}</option>
        {this.renderOptions()}
      </select>
    </div>`

  val: ->
    $('select#region_selector').val()

  handleChange: ->
    DevelopmentActions.filterData(region: @val())

