Scroll = require('react-scroll')
Link   = Scroll.Link

window.DevelopmentScrollNav = React.createClass

  render: ->
    `<div className="scroll__nav scroll__nav--fixed">
      <ul>
        <li role="presentation" className="scroll__li active">
          <Link activeClass="active" to="overview">
            Overview
          </Link>
        </li>
        <li role="presentation" className="scroll__li">
          <Link activeClass="active" to="location">
            Location
          </Link>
        </li>
        <li role="presentation" className="scroll__li">
          <Link activeClass="active" to="location">
            Pricing
          </Link>
        </li>
      </ul>
      {this.renderLogo()}
    </div>`

  renderLogo: ->
    return '' unless @props.development.logo_url
    `<img src={this.props.development.logo_url} alt={this.props.development.address} className="scroll__logo" />`
