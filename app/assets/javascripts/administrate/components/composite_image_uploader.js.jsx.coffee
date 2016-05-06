@CompositeImageUploader = React.createClass
 
  getInitialState: ->
    {
      images: @props.images
    }

  render: ->
    `<div className="composite-image-uploader">
      <Dropzone className="dropzone" ref="dropzone" onDrop={this.onDrop}>
        <div>Drop images here,<br/>or click to select files.</div>
      </Dropzone>
      <div>
        {this.renderPreviews()}
      </div>
    </div>`

  renderPreviews: ->
    _.map @state.images, (image) ->
      `<CompositeImageUploaderItem key={image.id} image={image} />`

  onDrop: (files) ->
    _.each files, (file) =>
      data = new FormData()
      data.append('image[file]', file)
      data.append('image[type]', 'DevelopmentPhoto')
      data.append('image[imageable_id]', @props.imageable.id)
      data.append('image[imageable_type]', 'Development')

      $.ajax
        url: '/api/images'
        type: 'POST'
        data: data
        cache: false
        dataType: 'json'
        processData: false
        contentType: false
        success: (data, textStatus, jqXHR) =>
          @setState(images: @state.images.concat(data))
        error: (jqXHR, textStatus, error) ->
          console.log [ data, textStatus, jqXHR ]

  
