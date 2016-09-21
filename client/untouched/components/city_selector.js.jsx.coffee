@CitySelector = React.createClass

  render: ->
    `<div className='form__group'>
      <select className='select'>
        <option key='Melbourne' value='Melbourne'>Melbourne ({this.getFacetCount()})</option>
      </select>
    </div>`

  getFacetCount: ->
    return 0 unless @props.facets?.city
    facet = _.find(@props.facets.city, (pair) -> pair[0] == 'Melbourne')
    return 0 unless facet
    facet[1]

