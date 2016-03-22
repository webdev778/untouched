@DevelopmentListItem = React.createClass
  render: ->
    `<tr>
      <td className="asset-wrap">
        <a href="#!" className="asset">
        <div className="asset__text">
          <span className="asset__location">{this.props.data.suburb}</span>
        </div>
        </a>
      </td>
      <td>399</td>
      <td>499</td>
    </tr>`

