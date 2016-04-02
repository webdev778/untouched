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
          {this.props.developments.map(function(development) {
            return <DevelopmentListItem key={development.id} data={development} />;
          })}
        </tbody>
      </table>
    </div>`

  classForHeading: (name) ->
    'active' if @props.filters?.sort == name

  handleSortColumn: (name) ->
    => @sortColumn(name)
      
  sortColumn: (name) ->
    DevelopmentActions.filterData(sort: name, sort_order: @toggleSortOrder())

  toggleSortOrder: ->
    if @props.filters?.sort_order == 'desc' then 'asc' else 'desc'

