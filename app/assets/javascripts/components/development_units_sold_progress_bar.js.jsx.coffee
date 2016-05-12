@DevelopmentUnitsSoldProgressBar = React.createClass

  render: ->
    `<div className="progress">
      <div className="bar">
        <div className="bar__stripe">
          <span data-percent={this.soldPercentage()} style={{width: this.soldPercentage() + '%'}}></span>
        </div>
        <span className="bar__text">
          {this.soldPercentage()}% sold
        </span>
      </div>
    </div>`

  soldPercentage: ->
    Math.round((@props.development.units_sold_count / @props.development.units_count) * 100)

