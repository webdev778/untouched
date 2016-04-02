@LocationSelector = React.createClass
  render: ->
    `<div className='sidebar__box'>
      <h4 className='sidebar__title'>Location</h4>
      <CitySelector />
      <RegionSelector filters={this.props.filters} />
    </div>`


