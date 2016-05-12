@UnitScrollNav = React.createClass

  render: ->
    `<div className="scroll__nav scroll__nav--static">
      <ul>
        <li role="presentation" className="scroll__li">
          <a href="#location">Plans</a>
        </li>
        <li role="presentation" className="scroll__li">
          <a href="#overview">Views</a>
        </li>
        <li role="presentation" className="scroll__li">
          <a href="#pricing">Costs</a>
        </li>
      </ul>
      {this.renderDevelopmentLogo()}
    </div>`

  renderDevelopmentLogo: ->
    if @props.unit.development_logo_url
      `<img src={this.props.unit.development_logo_url} alt={this.props.unit.development.address} className="scroll__logo" />`

