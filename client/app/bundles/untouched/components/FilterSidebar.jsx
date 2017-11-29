import React, { Component } from 'react';

import MaxPriceSelector from './filter/MaxPriceSelector';
import LocationSelector from './filter/LocationSelector';
import BedroomSelector from './filter/BedroomSelector';
import BathroomSelector from './filter/BathroomSelector';
import ParkingSelector from './filter/ParkingSelector';
import M2Selector from './filter/M2Selector';
import AspectSelector from './filter/AspectSelector';
import ResidenceFilterGroup from './filter/ResidenceFilterGroup';
import BodyCorpSelector from './filter/BodyCorpSelector';
import BuildingFilterGroup from './filter/BuildingFilterGroup';
import DevelopmentSizeSelector from './filter/DevelopmentSizeSelector';
import UnitTypeFilterGroup from './filter/UnitTypeFilterGroup';
import ReadyDateSelector from './filter/ReadyDateSelector';

export default class FilterSidebar extends Component {

  render() {
    return (
      <form>
        <MaxPriceSelector actions={this.props.actions} facets={this.getFacet('price')} filters={this.props.filters} />
        {this.renderLocationSelector()}
        <BedroomSelector actions={this.props.actions} facets={this.getFacet('bedrooms')} filters={this.props.filters} />
        <BathroomSelector actions={this.props.actions} facets={this.getFacet('bathrooms')} filters={this.props.filters} />
        <ParkingSelector actions={this.props.actions} facets={this.getFacet('parking')} filters={this.props.filters} />

        <M2Selector
          rangeStart="40"
          rangeEnd="200"
          step="5"
          label="Internal"
          id="internal_m2_selector"
          paramName="internal_in_meters"
          actions={this.props.actions}
          facets={this.getFacet('internal_in_meters')}
          filters={this.props.filters} />

        <M2Selector
          rangeStart="5"
          rangeEnd="100"
          step="5"
          label="External"
          id="external_m2_selector"
          paramName="external_in_meters"
          actions={this.props.actions}
          facets={this.getFacet('external_in_meters')}
          filters={this.props.filters} />

        <AspectSelector actions={this.props.actions} facets={this.getFacet('aspect')} filters={this.props.filters} />
        <ResidenceFilterGroup actions={this.props.actions} facets={this.props.facets} filters={this.props.filters} />
        <BodyCorpSelector actions={this.props.actions} facets={this.getFacet('max_body_corporate_fee')} filters={this.props.filters} />
        {this.renderBuildingFilterGroup()}
        {this.renderDevelopmentSizeSelector()}
        {this.renderUnitTypeFilterGroup()}
        {this.renderReadyDateSelector()}
      </form>
    );
  }

  getFacet(name) {
    return _.get(this.props.facets, name);
  }

  renderLocationSelector() {
    if (!this.props.development) {
      return <LocationSelector actions={this.props.actions} facets={this.props.facets} filters={this.props.filters} />;
    }
  }

  renderBuildingFilterGroup() {
    if (!this.props.development) {
      return <BuildingFilterGroup actions={this.props.actions} facets={this.props.facets} filters={this.props.filters} />;
    }
  }

  renderDevelopmentSizeSelector() {
    if (!this.props.development) {
      return <DevelopmentSizeSelector actions={this.props.actions} facets={this.getFacet('units_count')} filters={this.props.filters} />;
    }
  }

  renderUnitTypeFilterGroup() {
    return <UnitTypeFilterGroup actions={this.props.actions} facets={this.getFacet('unit_type')} filters={this.props.filters} />;
  }

  renderReadyDateSelector() {
    if (!this.props.development) {
      return <ReadyDateSelector actions={this.props.actions} facets={this.getFacet('ready_at')} filters={this.props.filters} />;
    }
  }
}
