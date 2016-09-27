import React, { Component } from 'react';
import Dropzone from 'react-dropzone';
import ReactOnRails from 'react-on-rails';
import CompositeImageUploaderItem from './CompositeImageUploaderItem';

export default class CompositeImageUploader extends Component {

  state = {
    images: this.props.images
  }

  render() {
    return (
      <div className="composite-image-uploader">
        <Dropzone className="dropzone" ref="dropzone" onDrop={this.onDrop}>
          <div>Drop images here,<br/>or click to select files.</div>
        </Dropzone>
        <div>
          {this.renderPreviews()}
        </div>
      </div>
    );
  }

  renderPreviews() {
    const { onDeleteItem } = this;
    return _.map(this.state.images, image => (
      <CompositeImageUploaderItem onDelete={onDeleteItem} key={image.id} image={image} />
    ));
  }

  onDrop = (files) => {
    return _.each(files, file => {
      const data = new FormData();
      data.append('image[file]', file);
      data.append('image[type]', this.props.type);
      data.append('image[imageable_id]', this.props.imageable.id);
      data.append('image[imageable_type]', this.props.imageable_type);

      return $.ajax({
        url: '/api/images',
        type: 'POST',
        headers: ReactOnRails.authenticityHeaders(),
        data,
        cache: false,
        dataType: 'json',
        processData: false,
        contentType: false,
        success: (data, textStatus, jqXHR) => {
          return this.setState({images: this.state.images.concat(data)});
        },
        error(jqXHR, textStatus, error) {
          return console.log([ data, textStatus, jqXHR ]);
        }
      });
    }
    );
  }
  
  onDeleteItem = (event) => {
    event.persist();
    
    if (confirm("Are you sure you want to delete this?")) {
      return $.ajax({
        url: `/api/images/${event.target.value}`,
        headers: ReactOnRails.authenticityHeaders(),
        method: 'DELETE',
        success: (data, textStatus, jqXHR) => {
          return this.setState({images: _.reject(this.state.images, i => i.id === parseInt(event.target.value))});
        },
        error(jqXHR, textStatus, error) {
          return console.log([ textStatus, jqXHR ]);
        }});
    }
  }
}


