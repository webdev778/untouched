@DevelopmentList = React.createClass

  render: ->
    console.log @props
    `<div className='table-responsive'>
      <table className='table'>
        <thead>
          <tr>
            <th>Suburb</th>
            <th className="active">Price (000's)</th>
            <th>Beds</th>
            <th>Baths</th>
            <th>Parking</th>
            <th>Int M2</th>
            <th>Master M2</th>
            <th>External M2</th>
          </tr>
        </thead>
        <tbody>
          {this.props.developments.map(function(development) {
            return <DevelopmentListItem key={development.id} data={development} />;
          })}
        </tbody>
      </table>
    </div>`

