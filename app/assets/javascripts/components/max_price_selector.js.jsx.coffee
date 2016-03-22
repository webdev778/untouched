@MaxPriceSelector = React.createClass

  RANGE_IN_HUNDRED_THOUDANDS: [ 4, 20 ]

  renderNumericOptions: ->
    _.map _.range(4, 20), (hundoThousands) ->
      value = hundoThousands * 100000
      `<option key={hundoThousands} value={value}>{value}</option>`

  render: ->
    `<div className='sidebar__box'>
      <h4 className='sidebar__title'>Max Price</h4>
      <select id='max_price_selector' className='select' onChange={this.handleChange}>
        <option key='any' value='any'>Any</option>
        {this.renderNumericOptions()}
      </select>
    </div>`

  val: ->
    $('select#max_price_selector').val()

  handleChange: ->
    DevelopmentActions.filterData(max_price: @val())

