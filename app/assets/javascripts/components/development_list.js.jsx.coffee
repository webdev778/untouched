@DevelopmentList = React.createClass

  componentDidMount: ->
    @sort_order = 'asc'

  render: ->
    `<div className='table-responsive'>
      <table className='table'>
        <thead>
          <tr>
            <th onClick={this.handleClickSuburbHeading}>Suburb</th>
            <th onClick={this.handleClickPriceHeading} className="active">From $ ('000)</th>
          </tr>
        </thead>
        <tbody>
          {this.props.developments.map(function(development) {
            return <DevelopmentListItem key={development.id} data={development} />;
          })}
        </tbody>
      </table>
    </div>`

  handleClickSuburbHeading: (event) ->
    @sortColumn(event.target, 'suburb')

  handleClickPriceHeading: (event) ->
    @sortColumn(event.target, 'price')

  sortColumn: (heading_el, name) ->
    @initSortOrder(heading_el)
    $(heading_el).parent().children().removeClass('active')
    $(heading_el).addClass('active')
    DevelopmentActions.filterData(sort: name, sort_order: @sort_order)



  toggleSortOrder: ->
    @sort_order = if @sort_order == 'desc' then 'asc' else 'desc'

  initSortOrder: (heading_el) ->
    if $(heading_el).hasClass('active')
      @toggleSortOrder()
    else
      @sort_order = 'asc'

