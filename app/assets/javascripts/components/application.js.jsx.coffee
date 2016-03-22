@Application = React.createClass
  render: ->
    `<div className='application'>
      <Header />
      <div className='container'>
        <aside className='sidebar'>
          <DevelopmentFilter />
        </aside>
        <main className='main'>
          <DevelopmentList data={this.props.developments} />
        </main>
      </div>
     </div>`


