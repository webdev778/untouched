import React, { Component } from 'react';
import ReactOnRails from 'react-on-rails';

export default class CompositeImageUploaderItem extends Component {

  render() {
    return (
      <div className="composite-image-uploader-item">
        <div className="image">
          <img key={this.props.image.id} src={this.props.image.url} />
        </div>
        <div className="form">
          <textarea ref={(ref) => this.caption = ref} onChange={this.onChange} defaultValue={this.props.image.caption} placeholder="Enter a caption" />
          <br/>
          <input ref={(ref) => this.sort = ref} type="number" onChange={this.onChange} defaultValue={this.props.image.sort} placeholder="Enter a sort value" />
          <br/>
          <button value={this.props.image.id} onClick={this.props.onDelete}>Delete</button>
        </div>
      </div>
    );
  }

  onChange = (event) => {
    return $.ajax({
      url: `/api/images/${this.props.image.id}`,
      method: 'PUT',
      headers: ReactOnRails.authenticityHeaders(),
      data: {
        image: {
          caption: this.caption.value,
          sort: this.sort.value
        }
      },
      dataType: 'json',
      success: (data, textStatus, jqXHR) => {
        return this;
      },
      error(jqXHR, textStatus, error) {
        return console.log([ textStatus, jqXHR ]);
      }
    });
  }
}

