@DevelopmentFilter = React.createClass
  render: ->
    `<form>
      <MaxPriceSelector filters={this.props.filters} />
      <LocationSelector filters={this.props.filters} />
      <BedroomSelector filters={this.props.filters} />
      <BathroomSelector filters={this.props.filters} />
      <ParkingSelector filters={this.props.filters} />

      <M2Selector 
        rangeStart="40" 
        rangeEnd="200" 
        step="5" 
        label="Internal" 
        id="internal_m2_selector" 
        paramName="internal_in_meters"
        filters={this.props.filters} />

      <M2Selector 
        rangeStart="10" 
        rangeEnd="50"
        step="5" 
        label="Master Bedroom" 
        id="master_bedroom_m2_selector" 
        paramName="master_bedroom_in_meters"
        filters={this.props.filters} />

      <M2Selector 
        rangeStart="5" 
        rangeEnd="100"
        step="5" 
        label="External" 
        id="external_m2_selector" 
        paramName="external_in_meters"
        filters={this.props.filters} />

      <AspectSelector filters={this.props.filters} />
      <ResidenceFilterGroup filters={this.props.filters} />
      <BodyCorpSelector filters={this.props.filters} />
      <BuildingFilterGroup filters={this.props.filters} />
      <CeilingHeightSelector filters={this.props.filters} />
      <DevelopmentSizeSelector filters={this.props.filters} />
      <DevelopmentTypeFilterGroup filters={this.props.filters} />
      <ReadyDateSelector filters={this.props.filters} />
    </form>`

