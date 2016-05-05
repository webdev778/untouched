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
      _.extend u, {
        status: u.status?.toString() || ''
        kitchen_island: if u.kitchen_island then 't' else ''
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

    `<Table className="development-table-editor collection-data" columns={columns} data={data} />`

  properties: 
    number:
      type: 'string'
    aspect:
      type: 'string'
      options: [
        {
          name: 'North'
          value: 'north'
        }
        {
          name: 'South'
          value: 'south'
        }
        {
          name: 'East'
          value: 'east'
        }
        {
          name: 'West'
          value: 'west'
        }
      ]
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
    kitchen_island:
      type: 'boolean'

  getInitialData: ->
    [ ]

  editable: ->
    cells.edit.bind(@, 'editedCell', (value, cellData, rowIndex, property) =>
      id  = cellData[rowIndex].id
      idx = _.findIndex(@state.data, { id: id })

      @state.data[idx][property] = value

      params = {}
      params[property] = value

      UnitActions.updateUnit(id, params)
    )

  inputColumn: (prop, header, formatter) ->
    {
      property: prop
      header: header
      cell: _.compact([ @editable()(editor: editors.input()), formatter ])
    }

  dropdownColumn: (prop, header, options, formatter) ->
    {
      property: prop
      header: header
      cell: [ 
        @editable()({editor: editors.dropdown(options)})
        formatter
      ]
    }

  booleanColumn: (prop, header) ->
    {
      property: prop
      header: header
      cell: [ 
        @editable()({editor: editors.boolean()})
        (active) => active && `<span>&#10003;</span>`
      ]
    }

  getColumns: ->
    [
      @inputColumn('number', 'Number')
      @dropdownColumn('status', 'Status', @properties.status.options, ((v) -> _.upperFirst(v)))
      @inputColumn('price', 'Price ($)', ((v) -> accounting.formatMoney(v)))
      @inputColumn('bedrooms', 'Beds')
      @inputColumn('bathrooms', 'Baths')
      @inputColumn('parking', 'Parking')
      @inputColumn('internal_in_meters', 'Int M2', ((v) -> parseInt(v)))
      @inputColumn('master_bedroom_in_meters', 'Master M2', ((v) -> parseInt(v)))
      @inputColumn('external_in_meters', 'Ext M2', ((v) -> parseInt(v)))
      @dropdownColumn('aspect', 'Aspect', @properties.aspect.options, ((v) -> _.upperFirst(v)))
      @inputColumn('max_body_corporate_fee', 'Body Corp ($)', ((v) -> accounting.formatMoney(v)))
      @inputColumn('annual_council_rate', 'Annual Council ($)', ((v) -> accounting.formatMoney(v)))
      @booleanColumn('kitchen_island', 'Kitchen Island')
      @booleanColumn('ensuite', 'Ensuite')
      @booleanColumn('study_nook', 'Study Nook')
      @booleanColumn('storage_cage', 'Storage Cage')
      @booleanColumn('walk_in_wardrobe', 'Walk-in Wardrobe')
      @booleanColumn('bathtub', 'Bathtub')
      @booleanColumn('penthouse_level', 'Penthouse')
      @booleanColumn('no_stacker', 'No Stacker')
    ]

