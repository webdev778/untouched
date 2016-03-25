@DevelopmentSizeSelector = React.createClass

  OPTIONS: [ 20, 50, 100 ]

  renderOptions: ->
    _.map @OPTIONS, (value) ->
      `<option key={value} value={value}>&lt; {value} residences</option>`

  render: ->
    `<div className='sidebar__box'>
      <SidebarTitle value="Development Size" />
      <select id="development_size" className='select' onChange={this.handleChange}>
        <option value="">Any</option>
        {this.renderOptions()}
      </select>
    </div>`

  val: ->
    $("select#development_size").val()

  handleChange: ->
    DevelopmentActions.filterData(units_count: @val())

