@UnitList = React.createClass

  getInitialState: ->
    {
      units: []
    }

  componentWillMount: ->
    UnitStore.listen(@onChange)
    UnitActions.filterData(@getFilterParams())

  componentWillUnmount: ->
    UnitStore.unlisten(@onChange)

  onChange: (state) ->
    @setState(state)

  getFilterParams: ->
    _.assign { development_id: @props.development.id }, @props.filters

  render: ->
    `<div className='table-responsive'>
      <table className='table'>
        <thead>
          <tr>
            <th>&nbsp;</th>
            {this.renderHeadings()}
          </tr>
        </thead>
        <tbody>
          {this.state.units.map((unit, index) => {
            if (index === 0) {
              return <UnitListItem key={unit.id} unit={unit} tip={this.props.tip}/>;
            } else {
              return <UnitListItem key={unit.id} unit={unit} />;
            }
          })}
        </tbody>
      </table>
    </div>`

  HEADINGS:
    number: 'Unit'
    bedrooms: 'Beds'
    bathrooms: 'Baths'
    internal_in_meters: 'Int M2'
    external_in_meters: 'Ext M2'
    aspect: 'Aspect'
    price: 'Price'

  renderHeadings: ->
    classForHeading = @classForHeading
    handleSortColumn = @handleSortColumn
    _.map @HEADINGS, (title, column) =>
      `<th key={column} className={classForHeading(column)} onClick={handleSortColumn(column)}>{title}</th>`

  classForHeading: (name) ->
    'active' if @state.filterParams?.sort == name

  handleSortColumn: (name) ->
    => @sortColumn(name)

  sortColumn: (name) ->
    UnitActions.filterData(sort: name, sort_order: @toggleSortOrder(name))

  toggleSortOrder: (columnName) ->
    # We want to sort ascending if the sort column has changed.
    return 'asc' if @state.filterParams?.sort != columnName
    if @state.filterParams?.sort_order == 'desc' then 'asc' else 'desc'

