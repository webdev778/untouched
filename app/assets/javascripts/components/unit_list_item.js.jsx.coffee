@UnitListItem = React.createClass

  formattedPrice: ->
    Math.round(@props.unit.price / 1000.0)

  formattedPricePerM2: ->
    Math.round(@props.unit.price_per_m2 / 1000.0)

  photoUrl: ->
    @props.data.development.photos[0]?.url

  unitUrl: ->
    "#/developments/#{@props.unit.development_id}/units/#{@props.unit.id}"

  render: ->
    `<tr>
      <td>&nbsp;</td>
      <td><a href={this.unitUrl()}>{this.props.unit.number}</a></td>
      <td>{this.props.unit.bedrooms}</td>
      <td>{this.props.unit.bathrooms}</td>
      <td>{this.props.unit.internal_in_meters}</td>
      <td>{this.props.unit.external_in_meters}</td>
      <td>{this.props.unit.aspect}</td>
      <td>{this.formattedPrice()}</td>
      <td>{this.formattedPricePerM2()}</td>
    </tr>`

