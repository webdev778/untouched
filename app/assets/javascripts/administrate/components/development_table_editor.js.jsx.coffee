Table = Reactabular.Table
editors = Reactabular.editors
cells = Reactabular.cells

@DevelopmentTableEditor = React.createClass

  getInitialState: ->

    properties = {
      number:
        type: 'number'
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
    }

    editable = cells.edit.bind(@, 'editedCell', (value, cellData, rowIndex, property) =>
      idx = _.findIndex(@state.data, {
        id: cellData[rowIndex].id
      })

      @state.data[idx][property] = value
      @setState(data: @state.data)
    )

    {
      data: [
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
      columns: [
        {
          property: 'number'
          header: 'Number'
          cell: [ editable({editor: editors.input()}) ]
        }
        {
          property: 'status'
          header: 'Status'
          cell: [ editable({editor: editors.dropdown(properties.status.options)}) ]
        }
      ]
    }

  render: ->
    columns = @state.columns || []
    data    = @state.data    || []

    `<Table className="collection-data" columns={columns} data={data} />`


