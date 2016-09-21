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

  _checkViewport: ->
    el = document.querySelector('.unit-list-item__tip')
    if (!el)
      @stopWatching()
      return

    position = el.getBoundingClientRect()
    isBelowViewBox = window.innerHeight - position.top < 0
    isAboveViewBox = position.bottom < 0
    if (!isBelowViewBox && !isAboveViewBox)
      @stopWatching()
      TipActions.tipVisible(true)

  startWatching: ->
    window.addEventListener 'scroll', @_checkViewport
    @_interval = setInterval @_checkViewport, 500

  stopWatching: ->
    window.removeEventListener 'scroll', @_checkViewport
    clearInterval @_interval

  componentDidMount: ->
    if (@props.tip)
      @startWatching()

  componentWillUnmount: ->
    @stopWatching

  render: ->
    `<tr>
      <td>&nbsp;</td>
      <td className={this.props.tip ? 'unit-list-item__tip' : ''}><a href={this.unitUrl()}>{this.props.unit.number}</a></td>
      <td>{this.props.unit.bedrooms}</td>
      <td>{this.props.unit.bathrooms}</td>
      <td>{Math.round(this.props.unit.internal_in_meters)}</td>
      <td>{Math.round(this.props.unit.external_in_meters)}</td>
      <td>{this.props.unit.aspect}</td>
      <td>{this.formattedPrice()}</td>
    </tr>`

