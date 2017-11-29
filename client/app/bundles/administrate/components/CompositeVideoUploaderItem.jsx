import React, { Component } from 'react';
import ReactOnRails from 'react-on-rails';

export default class CompositeVideoUploaderItem extends Component {

  render() {
    return (
      <div className="composite-video-uploader-item">
        <div className="video" dangerouslySetInnerHTML={{__html: this.props.video.iframe }} />
        <div className="form">
          <textarea ref={(ref) => this.iframe = ref} onChange={this.onChange} defaultValue={this.props.video.iframe} placeholder="Enter a iframe" />
          <br/>          
          <textarea ref={(ref) => this.caption = ref} onChange={this.onChange} defaultValue={this.props.video.caption} placeholder="Enter a caption" />
          <br/>
          <input ref={(ref) => this.sort = ref} type="number" onChange={this.onChange} defaultValue={this.props.video.sort} placeholder="Enter a sort value" />
          <br/>
          <button value={this.props.video.id} onClick={this.props.onDelete}>Delete</button>
        </div>
      </div>
    );
  }

  onChange = (event) => {
    return $.ajax({
      url: `/api/videos/${this.props.video.id}`,
      method: 'PUT',
      headers: ReactOnRails.authenticityHeaders(),
      data: {
        video: {
          iframe: this.iframe.value,
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

