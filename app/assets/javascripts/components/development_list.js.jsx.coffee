@DevelopmentList = React.createClass

  render: ->
    `<div className='table-responsive'>
      <table className='table'>
        <thead>
          <tr>
            <th onClick={this.sortBySuburb}>Suburb</th>
            <th onClick={this.sortByPrice} className="active">Price (000's)</th>
          </tr>
        </thead>
        <tbody>
          {this.props.developments.map(function(development) {
            return <DevelopmentListItem key={development.id} data={development} />;
          })}
        </tbody>
      </table>
    </div>`

  sortBySuburb: (event) ->
    $(event.target).parent().children().removeClass('active')
    $(event.target).addClass('active')

    DevelopmentActions.filterData(sort: 'suburb')

  sortByPrice: (event) ->
    $(event.target).parent().children().removeClass('active')
    $(event.target).addClass('active')

    DevelopmentActions.filterData(sort: 'price')


