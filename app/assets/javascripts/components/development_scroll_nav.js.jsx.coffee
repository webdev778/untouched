@DevelopmentScrollNav = React.createClass

  render: ->
    `<div className="scroll__nav scroll__nav--fixed">
      <ul>
        <li role="presentation" className="scroll__li active">
          <a href="#overview">Overview</a>
        </li>
        <li role="presentation" className="scroll__li">
          <a href="#location">Location</a>
        </li>
        <li role="presentation" className="scroll__li">
          <a href="#pricing">pricing</a>
        </li>
      </ul>
      {this.renderLogo()}
    </div>`

  renderLogo: ->
    return '' unless @props.development.logo_url
    `<img src={this.props.development.logo_url} alt={this.props.development.address} className="scroll__logo" />`
