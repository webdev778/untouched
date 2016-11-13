import React, { Component } from 'react';
import ReactOnRails from 'react-on-rails';
import CompositeVideoUploaderItem from './CompositeVideoUploaderItem';

export default class CompositeVideoUploader extends Component {

  state = {
    videos: this.props.videos
  }

  render() {
    return (
      <div className="composite-video-uploader">
        <div className="form">
          <textarea ref={(ref) => this.iframe = ref} onChange={this.onChange} placeholder="Enter a iframe" />
          <br/>          
          <textarea ref={(ref) => this.caption = ref} onChange={this.onChange} placeholder="Enter a caption" />
          <br/>
          <button onClick={this.onSubmit}>Add</button>
        </div>
        <div>
          {this.renderPreviews()}
        </div>
      </div>
    );
  }

  renderPreviews() {
    const { onDeleteItem } = this;
    return _.map(this.state.videos, video => (
      <CompositeVideoUploaderItem onDelete={onDeleteItem} key={video.id} video={video} />
    ));
  }

  onSubmit = () => {
    const data = new FormData();
    data.append('video[iframe]', this.iframe.value);
    data.append('video[caption]', this.caption.value);
    data.append('video[type]', this.props.type);
    data.append('video[videoable_id]', this.props.videoable.id);
    data.append('video[videoable_type]', this.props.videoable_type);

    return $.ajax({
      url: '/api/videos',
      type: 'POST',
      headers: ReactOnRails.authenticityHeaders(),
      data,
      cache: false,
      dataType: 'json',
      processData: false,
      contentType: false,
      success: (data, textStatus, jqXHR) => {
        this.iframe.value = '';
        this.caption.value = '';
        return this.setState({videos: this.state.videos.concat(data)});
      },
      error(jqXHR, textStatus, error) {
        return console.log([ data, textStatus, jqXHR ]);
      }
    });
  }
  
  onDeleteItem = (event) => {
    event.persist();
    
    if (confirm("Are you sure you want to delete this?")) {
      return $.ajax({
        url: `/api/videos/${event.target.value}`,
        headers: ReactOnRails.authenticityHeaders(),
        method: 'DELETE',
        success: (data, textStatus, jqXHR) => {
          return this.setState({videos: _.reject(this.state.videos, i => i.id === parseInt(event.target.value))});
        },
        error(jqXHR, textStatus, error) {
          return console.log([ textStatus, jqXHR ]);
        }});
    }
  }
}


