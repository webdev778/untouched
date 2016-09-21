@InternalM2Selector = React.createClass

  STEP: 5
  RANGE: [ 40, 205 ]

  renderNumericOptions: ->
    _.map _.range(@RANGE..., @STEP), (value) ->
      `<option key={value} value={value}>&gt; {value}</option>`

  render: ->
    `<div className='sidebar__box'>
      <SidebarTitle value="Internal (M2)"/>
      <select id='internal_m2_selector' className='select' onChange={this.handleChange}>
        {this.renderNumericOptions()}
      </select>
    </div>`

  val: ->
    $('select#internal_m2_selector').val()

  handleChange: ->
    DevelopmentActions.filterData(internal_in_meters: @val())

