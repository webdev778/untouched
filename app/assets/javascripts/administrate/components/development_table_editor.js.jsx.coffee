Table = Reactabular.Table
editors = Reactabular.editors
cells = Reactabular.cells

@DevelopmentTableEditor = React.createClass

  componentWillMount: ->
    UnitStore.listen(@onChange)

  componentDidMount: ->
    UnitActions.filterData(development_id: 791)
    UnitActions.fetch()

  componentWillUnmount: ->
    UnitStore.unlisten(@onChange)

  formatData: (data) ->
    _.map(data, (u) ->
      {
        id: u.id
        number: parseInt(u.number)
        status: u.status?.toString() || ''
      }
    )

  onChange: (state) ->
    @setState(data: @formatData(state.units))

  getInitialState: ->
    {
      data: @getInitialData()
      columns: @getColumns()
    }

  render: ->
    columns = @state.columns || []
    data    = @state.data    || []

    `<Table className="collection-data" columns={columns} data={data} />`

  properties: 
    number:
      type: 'string'
    status:
      type: 'string'
      options: [
        {
          name: 'Active'
          value: 'active'
        }
        {
          name: 'Sold'
          value: 'sold'
        }
        {
          name: 'Held'
          value: 'held'
        }
      ]
    price:
      type: 'number'

  getInitialData: ->
    [
      {
        id: 1
        number: 101
        status: 'active'
      }
      {
        id: 2
        number: 102
        status: 'sold'
      }
    ]

  getColumns: ->
    editable = cells.edit.bind(@, 'editedCell', (value, cellData, rowIndex, property) =>
      id  = cellData[rowIndex].id
      idx = _.findIndex(@state.data, { id: id })

      @state.data[idx][property] = value

      params = {}
      params[property] = value

      UnitActions.updateUnit(id, params)
    )

    [
      {
        property: 'number'
        header: 'Number'
        cell: [ editable({editor: editors.input()}) ]
      }
      {
        property: 'status'
        header: 'Status'
        cell: [ editable({editor: editors.dropdown(@properties.status.options)}) ]
      }
    ]

