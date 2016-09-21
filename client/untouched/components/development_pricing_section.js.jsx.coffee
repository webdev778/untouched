window.DevelopmentPricingSection = React.createClass

  render: ->
    `<section className="scroll__section scroll__pricing">
      <div className="container">
        <div className="sidebar-wrap">
          <DevelopmentPricingSidebar
            facets={this.props.facets}
            filters={this.props.filters}
            params={this.props.params}
            development={this.props.development}/>
        </div>
        <div className="right">
          <div className="spaced3x container--reset">
            <UnitList
              filters={this.props.filters}
              development={this.props.development}
              tip={this.props.tip}/>
          </div>
          <DevelopmentUnitsSoldProgressBar development={this.props.development}/>
        </div>
      </div>
    </section>`



