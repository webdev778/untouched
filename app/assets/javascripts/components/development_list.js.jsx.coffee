@DevelopmentList = React.createClass

  render: ->
    `<div className='table-responsive'>
      <table className='table'>
        <thead>
          <tr>
            <th>Suburb</th>
            <th className="active">Price (000's)</th>
          </tr>
        </thead>
        <tbody>
          {this.props.developments.map(function(development) {
            return <DevelopmentListItem key={development.id} data={development} />;
          })}
        </tbody>
      </table>
    </div>`

