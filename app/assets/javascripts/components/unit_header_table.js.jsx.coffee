@UnitHeaderTable = React.createClass

  formattedPrice: ->
    Math.round(@props.unit.price / 1000.0)

  formattedPricePerM2: ->
    Math.round(@props.unit.price_per_m2 / 1000.0)

  developmentUrl: ->
    "/developments/#{@props.unit.development_id}"

  handleBack: (event) ->
    event.preventDefault()
    event.stopPropagation()
    window.history.back()
    return false

  render: ->
    `<div className="table-responsive table--noactive">
      <table className="table table--fixed">
        <tbody>
          <tr className="thead">
            <td rowSpan="2" className="btn-wrap">
              <a href={this.developmentUrl()} onClick={this.handleBack} className="btn--back">
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
            <td>{this.props.unit.number}</td>
            <td>{this.props.unit.bedrooms}</td>
            <td>{this.props.unit.bathrooms}</td>
            <td>{this.props.unit.internal_in_meters}</td>
            <td>{this.props.unit.external_in_meters}</td>
            <td>{this.props.unit.aspect}</td>
            <td>{this.props.unit.parking}</td>
            <td>{this.formattedPrice()}</td>
            <td>{this.formattedPricePerM2()}</td>
          </tr>
        </tbody>
      </table>
    </div>`
