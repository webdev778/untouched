accounting = require('accounting')

window.BodyCorpSelector = React.createClass

  STEP: 1000
  RANGE: [ 2000, 8000 ]

  renderNumericOptions: ->
    # We add 1 to the rangeEnd in order to ensure the last entry 
    # is the value of rangeEnd...
    _.map _.range(@RANGE[0], parseInt(@RANGE[1]) + 1, @STEP), (value) ->
      `<option key={value} value={value}>&lt; {accounting.formatMoney(value, '$', 0)}</option>`

  render: ->
    `<div className='sidebar__box'>
      <SidebarTitle value="Body Corp (Annual)" />
      <select value={this.initialValue()} id="max_body_corporate_fee" className='select' onChange={this.handleChange}>
        <option key='any' value=''>Any</option>
        {this.renderNumericOptions()}
      </select>
    </div>`

  initialValue: ->
    @props.filters?.max_body_corporate_fee

  val: ->
    $("select#max_body_corporate_fee").val()

  handleChange: ->
    @props.actions.filterData(max_body_corporate_fee: @val())

