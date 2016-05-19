@UnitPlansSection = React.createClass

  render: ->
    `<section className="scroll__section">
      <a name="views"></a>
      <div className="container">
        <div className="container__reset">
          {this.renderCards()}
        </div>
      </div>
    </section>`


  renderCards: ->
    _.map @props.unit.plans, (plan) ->
      `<ImageCard key={plan.id} image={plan} />`
