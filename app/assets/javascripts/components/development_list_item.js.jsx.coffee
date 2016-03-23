@DevelopmentListItem = React.createClass

  formattedPrice: ->
    Math.round(@props.data.price / 1000.0)

  render: ->
    `<tr>
      <td className="asset-wrap" style={{height: '114px'}}>
        <a href="#!" className="asset" style={{backgroundImage: 'url(' + this.props.data.development.photo_url + ')'}}>
          <div className="asset__text">
            <span className="asset__location">{this.props.data.development.suburb}</span>
          </div>
        </a>
      </td>
      <td>{this.formattedPrice()}</td>
      <td>{this.props.data.bedrooms}</td>
      <td>{this.props.data.bathrooms}</td>
      <td>{this.props.data.parking}</td>
      <td>{this.props.data.internal_in_meters}</td>
      <td>{this.props.data.master_bedroom_in_meters}</td>
      <td>{this.props.data.external_in_meters}</td>
    </tr>`

