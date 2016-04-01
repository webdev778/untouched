@M2Selector = React.createClass

  renderNumericOptions: ->
    # We add 1 to the rangeEnd in order to ensure the last entry 
    # is the value of rangeEnd...
    _.map _.range(@props.rangeStart, parseInt(@props.rangeEnd) + 1, @props.step), (value) ->
      `<option key={value} value={value}>&gt; {value}</option>`

  initialVal: ->
    @props.filters[@props.paramName]

  render: ->
    `<div className='sidebar__box'>
      <SidebarTitle value={this.props.label + ' (M2)'}/>
      <select value={this.initialVal()} id={this.props.id} className='select' onChange={this.handleChange}>
        {this.renderNumericOptions()}
      </select>
    </div>`

  val: ->
    $("select##{@props.id}").val()

  handleChange: ->
    params = {}
    params[@props.paramName] = @val()
    DevelopmentActions.filterData(params)

