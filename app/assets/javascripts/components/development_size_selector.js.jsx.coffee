@DevelopmentSizeSelector = React.createClass

  OPTIONS: [ 20, 50, 100 ]

  renderOptions: ->
    _.map @OPTIONS, (value) ->
      `<option key={value} value={value}>&lt; {value} residences</option>`

  render: ->
    `<div className='sidebar__box'>
      <SidebarTitle value="Development Size" />
      <select value={this.initialValue()} id="development_size" className='select' onChange={this.handleChange}>
        <option value="">Any</option>
        {this.renderOptions()}
      </select>
    </div>`

  initialValue: ->
    @props.filters?.units_count

  val: ->
    $("select#development_size").val()

  handleChange: ->
    @props.actions.filterData(units_count: @val())

