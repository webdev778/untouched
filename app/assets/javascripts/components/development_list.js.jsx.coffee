@DevelopmentList = React.createClass

  componentDidMount: ->

  render: ->
    `<div className='table-responsive'>
      <table className='table'>
        <thead>
          <tr>
            <th className={this.classForHeading('suburb')} onClick={this.handleSortColumn('suburb')}>Suburb</th>
            <th className={this.classForHeading('price')} onClick={this.handleSortColumn('price')}>From $ ('000)</th>
          </tr>
        </thead>
        <tbody>
          {this.renderItems()}
        </tbody>
      </table>
    </div>`

  renderItems: ->
    filters = @props.filters
    _.map @props.developments, (development) ->
      `<DevelopmentListItem key={development.id} filters={filters} data={development} />`

  classForHeading: (name) ->
    'active' if @props.filters?.sort == name

  handleSortColumn: (name) ->
    => @sortColumn(name)
      
  sortColumn: (name) ->
    DevelopmentActions.filterData(sort: name, sort_order: @toggleSortOrder())

  toggleSortOrder: ->
    if @props.filters?.sort_order == 'desc' then 'asc' else 'desc'

