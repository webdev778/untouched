@MaxPriceSelector = React.createClass

  RANGE_IN_HUNDRED_THOUSANDS: [ 4, 20 ]

  renderNumericOptions: ->
    _.map _.range(@RANGE_IN_HUNDRED_THOUSANDS...), (hundoThousands) ->
      value = hundoThousands * 100000
      `<option key={hundoThousands} value={value}>{accounting.formatMoney(value, '$', 0)}</option>`

  render: ->
    `<div className='sidebar__box'>
      <h4 className='sidebar__title'>Max Price</h4>
      <select defaultValue={this.props.filters.max_price} id='max_price_selector' className='select' onChange={this.handleChange}>
        <option key='any' value=''>Any</option>
        {this.renderNumericOptions()}
      </select>
    </div>`

  val: ->
    $('select#max_price_selector').val()

  handleChange: ->
    DevelopmentActions.filterData(max_price: @val())

