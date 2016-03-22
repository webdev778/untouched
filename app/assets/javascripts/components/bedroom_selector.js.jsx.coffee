@BedroomSelector = React.createClass


  render: ->
    `<div className='sidebar__box'>
      <h4 className='sidebar__title'>Bedrooms</h4>
      <div className="form__group">
        <input type="checkbox" name="bedrooms" id="bedrooms01" value="1" onClick={this.handleClick} />
        <label htmlFor="bedrooms01">1</label>
      </div>
      <div className="form__group">
        <input type="checkbox" name="bedrooms" id="bedrooms02" value="2" onClick={this.handleClick} />
        <label htmlFor="bedrooms02">2</label>
      </div>
      <div className="form__group">
        <input type="checkbox" name="bedrooms" id="bedrooms03" value="3" onClick={this.handleClick} />
        <label htmlFor="bedrooms03">3</label>
      </div>
      <div className="form__group">
        <input type="checkbox" name="bedrooms" id="bedrooms04" value="4" onClick={this.handleClick} />
        <label htmlFor="bedrooms04">4+</label>
      </div>
    </div>`

  val: ->
    _.map $("input[name='bedrooms']:checked"), (el) -> el.value

  handleClick: (event) ->
    console.log(@val())
    DevelopmentActions.filterData(bedrooms: @val())



