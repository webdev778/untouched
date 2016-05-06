Table = Reactabular.Table
editors = Reactabular.editors
cells = Reactabular.cells



@DevelopmentTableEditor = React.createClass

  componentWillMount: ->
    UnitStore.listen(@onChange)

  componentDidMount: ->
    UnitActions.filterData(development_id: @props.development.id)
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

    `<Table className="development-table-editor collection-data" columns={columns} data={data}>
      <DevelopmentTableEditorFooter 
        development={this.props.development}
        properties={this.properties} 
        columns={columns} />
    </Table>`

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
      type: 'input'
      cell: _.compact([ @editable()(editor: editors.input()), formatter ])
    }

  dropdownColumn: (prop, header, options, formatter) ->
    {
      property: prop
      header: header
      type: 'dropdown'
      cell: [ 
        @editable()({editor: editors.dropdown(options)})
        formatter
      ]
    }

  booleanColumn: (prop, header) ->
    {
      property: prop
      header: header
      type: 'boolean'
      cell: [ 
        @editable()({editor: editors.boolean()})
        (active) => active && `<span>&#10003;</span>`
      ]
    }

  imagesColumn: (prop, countProp, header) ->
    {
      property: countProp
      header: header
      type: 'images'
      cell: (value, cellData, rowIndex, property) ->
        id  = cellData[rowIndex].id
        `<span><a href={'/admin/units/'+id+'/'+prop}>{value} {prop}</a></span>`
    }

  formatters:
    number: (v) -> parseInt(v)
    capitalize: (v) -> _.upperFirst(v)
    money: (v) -> accounting.formatMoney(v, '$', 0)

  getColumns: ->
    [
      @inputColumn('number', 'Number')
      @dropdownColumn('status', 'Status', @properties.status.options, @formatters.capitalize)
      @inputColumn('price', 'Price', @formatters.money)
      @imagesColumn('views', 'views_count', 'Views')
      @imagesColumn('plans', 'plans_count', 'Plans')
      @inputColumn('bedrooms', 'Bd')
      @inputColumn('bathrooms', 'Bt')
      @inputColumn('parking', 'P')
      @inputColumn('internal_in_meters', 'IM2', @formatters.number)
      @inputColumn('master_bedroom_in_meters', 'MM2', @formatters.number)
      @inputColumn('external_in_meters', 'EM2', @formatters.number)
      @dropdownColumn('aspect', 'Aspect', @properties.aspect.options, @formatters.capitalize)
      @inputColumn('max_body_corporate_fee', 'Body', @formatters.money)
      @inputColumn('annual_council_rate', 'Council', @formatters.money)
      @inputColumn('stamp_duty', 'Stamp', @formatters.money)
      @inputColumn('stamp_duty_savings', 'Stamp Sav', @formatters.money)
      @booleanColumn('kitchen_island', 'KI')
      @booleanColumn('ensuite', 'E')
      @booleanColumn('study_nook', 'SN')
      @booleanColumn('storage_cage', 'SC')
      @booleanColumn('walk_in_wardrobe', 'WIW')
      @booleanColumn('bathtub', 'BT')
      @booleanColumn('penthouse_level', 'PH')
      @booleanColumn('no_stacker', 'NS')

    ]

