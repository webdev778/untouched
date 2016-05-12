@FilterSidebar = React.createClass
  render: ->
    `<form>
      <MaxPriceSelector actions={this.props.actions} filters={this.props.filters} />
      <LocationSelector actions={this.props.actions} filters={this.props.filters} />
      <BedroomSelector actions={this.props.actions} filters={this.props.filters} />
      <BathroomSelector actions={this.props.actions} filters={this.props.filters} />
      <ParkingSelector actions={this.props.actions} filters={this.props.filters} />

      <M2Selector 
        rangeStart="40" 
        rangeEnd="200" 
        step="5" 
        label="Internal" 
        id="internal_m2_selector" 
        paramName="internal_in_meters"
        actions={this.props.actions}
        filters={this.props.filters} />

      <M2Selector 
        rangeStart="5" 
        rangeEnd="100"
        step="5" 
        label="External" 
        id="external_m2_selector" 
        paramName="external_in_meters"
        actions={this.props.actions}
        filters={this.props.filters} />

      <AspectSelector actions={this.props.actions} filters={this.props.filters} />
      <ResidenceFilterGroup actions={this.props.actions} filters={this.props.filters} />
      <BodyCorpSelector actions={this.props.actions} filters={this.props.filters} />
      <BuildingFilterGroup actions={this.props.actions} filters={this.props.filters} />
      <CeilingHeightSelector actions={this.props.actions} filters={this.props.filters} />
      <DevelopmentSizeSelector actions={this.props.actions} filters={this.props.filters} />
      <DevelopmentTypeFilterGroup actions={this.props.actions} filters={this.props.filters} />
      <ReadyDateSelector actions={this.props.actions} filters={this.props.filters} />
    </form>`

