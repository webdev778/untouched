@MaxPriceSelector = React.createClass

  RANGE_IN_HUNDRED_THOUDANDS: [ 4, 20 ]

  renderNumericOptions: ->
    _.map _.range(4, 20), (hundoThousands) ->
      value = hundoThousands * 100000
      `<option key={hundoThousands} value={value}>{value}</option>`

  render: ->
    `<div className='sidebar__box'>
      <h4 className='sidebar__title'>Max Price</h4>
      <select className='select'>
        {this.renderNumericOptions()}
        <option key='any' value='any'>Any</option>
      </select>
    </div>`

