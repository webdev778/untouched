accounting = require('accounting')

window.DevelopmentListItem = React.createClass

  formattedPrice: ->
    accounting.formatMoney(@props.data.price, '$', 0)

  photoUrl: ->
    @props.data.development.photos[0]?.url

  developmentUrl: ->
    '/developments/' + @props.data.development.id +
      new RouteGenerator(@props.filters).generate()

  render: ->
    `<tr>
      <td className="asset-wrap">
        <a href={this.developmentUrl()} className="asset" style={{backgroundImage: 'url(' + this.photoUrl() + ')'}}>
          <div className="asset__text">
            <span className="asset__location">
              {this.props.data.development.address}, {this.props.data.development.suburb_name}
            </span>
          </div>
        </a>
      </td>
      <td>{this.formattedPrice()}</td>
    </tr>`

