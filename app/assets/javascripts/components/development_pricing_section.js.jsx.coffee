@DevelopmentPricingSection = React.createClass

  render: ->
    `<section className="scroll__section scroll__pricing">
      <a name="pricing"></a>
      <div className="container">
        <div className="sidebar-wrap">
          <DevelopmentPricingSidebar development={this.props.development}/>
        </div>
        <div className="right">
          <div className="spaced3x container--reset">
            <DevelopmentPricingTable development={this.props.development}/>
          </div>
          <DevelopmentUnitsSoldProgressBar development={this.props.development}/>
        </div>
      </div>
    </section>`



