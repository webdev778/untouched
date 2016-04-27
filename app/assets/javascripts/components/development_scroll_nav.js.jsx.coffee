@DevelopmentScrollNav = React.createClass

  render: ->
    `<div className="scroll__nav scroll__nav--fixed">
      <ul>
        <li role="presentation" className="scroll__li active">
          <a href="#overview">Overview</a>
        </li>
        <li role="presentation" className="scroll__li">
          <a href="#location">location</a>
        </li>
        <li role="presentation" className="scroll__li">
          <a href="#pricing">pricing</a>
        </li>
      </ul>
      {this.renderLogo()}
    </div>`

  renderLogo: ->
    return '' unless @props.development.logo
    `<img src={this.props.development.logo.url} alt="Development Logo" className="scroll__logo" />`
