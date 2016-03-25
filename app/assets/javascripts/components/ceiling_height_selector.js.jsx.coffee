@CeilingHeightSelector = React.createClass

  STEP: 0.1
  RANGE: [ 2.4, 4 ]

  renderNumericOptions: ->
    _.map _.range(@RANGE[0], parseInt(@RANGE[1]) + 0.1, @STEP), (value) ->
      value = value.toFixed(1)
      `<option key={value} value={value}>&gt; {value}m</option>`

  render: ->
    `<div className='sidebar__box'>
      <SidebarTitle value="Ceiling Height (Living Area)" />
      <select id="ceiling_height" className='select' onChange={this.handleChange}>
        {this.renderNumericOptions()}
      </select>
    </div>`

  val: ->
    $("select#ceiling_height").val()

  handleChange: ->
    DevelopmentActions.filterData(ceiling_height_at_living_area_in_meters: @val())
