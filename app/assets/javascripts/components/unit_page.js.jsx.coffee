@UnitPage = React.createClass

  status:
    loading: {}
    notFound: {}

  getInitialState: ->
    {
      unit: @status.loading
    }

  componentWillMount: ->
    # TODO: Can we find a less intrusive way to set the body class?
    $('body').addClass('sidebar-hide development')

    UnitStore.listen(@onChange)

  componentDidMount: ->
    UnitActions.select(@props.params.developmentId, @props.params.unitId)

  componentWillUnmount: ->
    UnitStore.unlisten(@onChange)

  onChange: (state) ->
    @setState(state)

  developmentUrl: ->
    "#/developments/#{@props.params.developmentId}"

  render: ->
    if @state.unit is @status.loading
      @renderLoading()
    else
      @renderSuccess()

  renderLoading: ->
    `<div className='unit-page'>
      <Header />
    </div>`

  formattedPrice: ->
    Math.round(@state.unit.price / 1000.0)

  formattedPricePerM2: ->
    Math.round((@state.unit.price / @state.unit.internal_in_meters) / 1000.0)

  renderSuccess: ->
    `<div className='unit-page'>

      <Header />

      <div className="scroll">
        <div className="scroll__fixed">
          <div className="container">
            <div className="table-responsive table--noactive">
              <table className="table table--fixed">
                <tbody>
                  <tr className="thead">
                    <td rowSpan="2" className="btn-wrap">
                      <a href={this.developmentUrl()} className="btn--back">
                        <SVGIcon icon="arrow-left" />
                      </a>
                    </td>
                    <td>&nbsp;</td>
                    <td><span className="vertical">Unit</span></td>
                    <td><span className="vertical">Beds</span></td>
                    <td><span className="vertical">Baths</span></td>
                    <td><span className="vertical">Int M2</span></td>
                    <td><span className="vertical">Ext M2</span></td>
                    <td><span className="vertical">Aspect</span></td>
                    <td><span className="vertical">Parking</span></td>
                    <td><span className="vertical">Price</span></td>
                    <td><span className="vertical">/ M2</span></td>
                  </tr>
                  <tr>
                    <td>&nbsp;</td>
                    <td>{this.state.unit.number}</td>
                    <td>{this.state.unit.bedrooms}</td>
                    <td>{this.state.unit.bathrooms}</td>
                    <td>{this.state.unit.internal_in_meters}</td>
                    <td>{this.state.unit.external_in_meters}</td>
                    <td>{this.state.unit.aspect}</td>
                    <td>{this.state.unit.parking}</td>
                    <td>{this.formattedPrice()}</td>
                    <td>{this.formattedPricePerM2()}</td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>

     </div>`


