accounting = require('accounting')

window.UnitListItem = React.createClass

  formattedPrice: ->
    accounting.formatMoney(@props.unit.price, '$', 0)

  formattedPricePerM2: ->
    accounting.formatMoney(@props.unit.price_per_m2, '$', 0)

  photoUrl: ->
    @props.data.development.photos[0]?.url

  unitUrl: ->
    "/developments/#{@props.unit.development_id}/units/#{@props.unit.id}"

  render: ->
    `<tr>
      <td>&nbsp;</td>
      <td><a href={this.unitUrl()}>{this.props.unit.number}</a></td>
      <td>{this.props.unit.bedrooms}</td>
      <td>{this.props.unit.bathrooms}</td>
      <td>{Math.round(this.props.unit.internal_in_meters)}</td>
      <td>{Math.round(this.props.unit.external_in_meters)}</td>
      <td>{this.props.unit.aspect}</td>
      <td>{this.formattedPrice()}</td>
      <td>{this.formattedPricePerM2()}</td>
    </tr>`

