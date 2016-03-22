@DevelopmentList = React.createClass
  render: ->
    `<div className='table-responsive'>
      <table className='table'>
        <thead>
          <tr>
            <th>Suburb</th>
            <th className="active">1 Bed</th>
            <th>2 Bed</th>
            <th className="hidden-xs">3 Bed</th>
          </tr>
        </thead>
        <tbody>
          {this.props.data.map(function(development) {
            return <DevelopmentListItem key={development.id} data={development} />;
          })}
        </tbody>
      </table>
    </div>`

