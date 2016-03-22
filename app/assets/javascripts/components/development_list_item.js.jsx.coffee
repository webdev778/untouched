@DevelopmentListItem = React.createClass

  formattedPrice: ->
    Math.round(@props.data.price / 1000.0)

  render: ->
    `<tr>
      <td className="asset-wrap">
        <a href="#!" className="asset">
        <div className="asset__text">
          <span className="asset__location">{this.props.data.development.suburb}</span>
        </div>
        </a>
      </td>
      <td>{this.formattedPrice()}</td>
    </tr>`

