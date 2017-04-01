import alt from '../alt';
import BrowserHistoryManager from './../browser_history_manager.js';

import DevelopmentActions from '../actions/development_actions';

class DevelopmentStore {

  static displayName = 'DevelopmentStore';

  DEFAULT_FILTER_PARAMS = {
    sort: 'price',
    sort_order: 'desc'
  };

  constructor() {
    this.bindActions(DevelopmentActions);
    this.developments = [];
    this.filterParams = this.DEFAULT_FILTER_PARAMS;

    this.exportPublicMethods({
      getDevelopments: this.getDevelopments
    });
  }

  onInitData(props) {
    this.developments = props.developments;
  }

  onAddFilterData(params) {
    _.assign(this.filterParams, params);
  }  

  onFilterData(params) {
    _.assign(this.filterParams, params);

    BrowserHistoryManager.push(this.filterParams);

    return this.fetch();
  }

  onSelect(id) {
    return $.ajax({
      method: 'GET',
      url: `/api/developments/${id}`,
      success: response => {
        this.development = response.development;
        this.emitChange();
      },
      error(response) {
        console.log('error');
        console.log(response);
      }
    });
  }

  fetch() {
    return $.ajax({
      method: 'GET',
      url: '/api/developments',
      data: this.filterParams,
      success: response => {
        this.developments = response.developments;
        this.facets = response.facets;
        delete this.development; // TODO: Why this fixed strange transition between developments and development page? Look url.
        this.emitChange();
      },
      error(response) {
        console.log('error');
        console.log(response);
      }
    });
  }

  fetch_latest() {
    return $.ajax({
      method: 'GET',
      url: '/api/latest_developments',
      success: response => {
        this.developments = response.developments;
        delete this.development; // TODO: Why this fixed strange transition between developments and development page? Look url.
        this.emitChange();
      },
      error(response) {
        console.log('error');
        console.log(response);
      }
    });
  }

  getDevelopments() {
    return this.getState().developments;
  }
}

export default alt.createStore(DevelopmentStore);

