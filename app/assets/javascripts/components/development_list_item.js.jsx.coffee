@DevelopmentListItem = React.createClass

  formattedPrice: ->
    Math.round(@props.data.price / 1000.0)

  photoUrl: ->
    @props.data.development.photos[0]?.url

  render: ->
    `<tr>
      <td className="asset-wrap">
        <a href={'/developments/' + this.props.data.development.id} className="asset" style={{backgroundImage: 'url(' + this.photoUrl() + ')'}}>
          <div className="asset__text">
            <span className="asset__location">
              {this.props.data.development.address}, {this.props.data.development.suburb_name}
            </span>
          </div>
        </a>
      </td>
      <td>{this.formattedPrice()}</td>
    </tr>`

