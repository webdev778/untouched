@ReadyDateSelector = React.createClass

  startYear: ->
    new Date().getFullYear()

  endYear: ->
    @startYear() + 5

  renderNumericOptions: ->
    _.map _.range(@startYear(), @endYear(), 0.25), (value) ->
      year = Math.floor(value)
      quarter = ((value - year) / 0.25) + 1
      value = moment(new Date("#{year}-#{(quarter*3)-2}-01")).toJSON()
      `<option key={value} value={value}>&lt; {year} Q{quarter}</option>`

  render: ->
    `<div className='sidebar__box'>
      <SidebarTitle value="Ready" />
      <select value={this.initialValue()} id="ready_date" className='select' onChange={this.handleChange}>
        <option key='any' value=''>Any</option>
        {this.renderNumericOptions()}
      </select>
    </div>`

  val: ->
    $("select#ready_date").val()

  handleChange: ->
    DevelopmentActions.filterData(ready_at: @val())

  initialValue: ->
    @props.filters?.ready_at
