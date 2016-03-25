@DevelopmentFilter = React.createClass
  render: ->
    `<form>
      <MaxPriceSelector filters={this.props.filters} />
      <LocationSelector filters={this.props.filters} regions={this.props.regions} />
      <BedroomSelector />
      <BathroomSelector />
      <ParkingSelector />

      <M2Selector 
        rangeStart="40" 
        rangeEnd="200" 
        step="5" 
        label="Internal" 
        id="internal_m2_selector" 
        paramName="internal_in_meters" />

      <M2Selector 
        rangeStart="10" 
        rangeEnd="50"
        step="5" 
        label="Master Bedroom" 
        id="master_bedroom_m2_selector" 
        paramName="master_bedroom_in_meters" />

      <M2Selector 
        rangeStart="5" 
        rangeEnd="100"
        step="5" 
        label="External" 
        id="external_m2_selector" 
        paramName="external_in_meters" />

      <AspectSelector />
      <ResidenceFilterGroup />
      <BodyCorpSelector />
      <BuildingFilterGroup />
      <CeilingHeightSelector />
      <DevelopmentSizeSelector />
      <DevelopmentTypeFilterGroup />
      <ReadyDateSelector />
    </form>`

