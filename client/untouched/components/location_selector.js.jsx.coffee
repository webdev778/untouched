@LocationSelector = React.createClass
  render: ->
    `<div className='sidebar__box'>
      <h4 className='sidebar__title'>Location</h4>
      <CitySelector facets={this.props.facets} actions={this.props.actions} />
      <RegionSelector 
        facets={this.props.facets}
        actions={this.props.actions}
        filters={this.props.filters} />
    </div>`


