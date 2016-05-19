window.DevelopmentPricingSection = React.createClass

  render: ->
    `<section className="scroll__section scroll__pricing">
      <div className="container">
        <div className="sidebar-wrap">
          <DevelopmentPricingSidebar params={this.props.params} development={this.props.development}/>
        </div>
        <div className="right">
          <div className="spaced3x container--reset">
            <UnitList development={this.props.development}/>
          </div>
          <DevelopmentUnitsSoldProgressBar development={this.props.development}/>
        </div>
      </div>
    </section>`



