@LocationSelector = React.createClass
  render: ->
    `<div className='sidebar__box'>
      <h4 className='sidebar__title'>Location</h4>
      <CitySelector actions={this.props.actions} />
      <RegionSelector 
        actions={this.props.actions}
        filters={this.props.filters} />
    </div>`


