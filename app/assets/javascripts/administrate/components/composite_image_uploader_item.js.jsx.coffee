@CompositeImageUploaderItem = React.createClass

  render: ->
    `<div className="composite-image-uploader-item">
      <div className="image">
        <img key={this.props.image.id} src={this.props.image.url} />
      </div>
      <div className="form">
        <input ref="caption" type="text" onChange={this.onChange} defaultValue={this.props.image.caption} placeholder="Enter a caption" />
        <br/>
        <input ref="sort" type="number" onChange={this.onChange} defaultValue={this.props.image.sort} placeholder="Enter a sort value" />
        <br/>
        <button value={this.props.image.id} onClick={this.props.onDelete}>Delete</button>
      </div>
    </div>`

  onChange: (event) ->
    $.ajax
      url: '/api/images/' + @props.image.id
      method: 'PUT'
      data:
        image:
          caption: @refs.caption.value
          sort: @refs.sort.value
      dataType: 'json'
      success: (data, textStatus, jqXHR) =>
        @
      error: (jqXHR, textStatus, error) ->
        console.log [ textStatus, jqXHR ]

