import alt from '../alt';
import BrowserHistoryManager from '../browser_history_manager.js';

import UnitActions from '../actions/unit_actions';

class UnitStore {

  static displayName = 'UnitStore';

  DEFAULT_FILTER_PARAMS = {
    sort: 'price',
    sort_order: 'asc'
  };

  constructor() {
    this.bindActions(UnitActions);
    this.units = [];
    this.facets = {};
    this.filterParams = {};
    _.assign(this.filterParams, this.DEFAULT_FILTER_PARAMS);

    this.exportPublicMethods({
      getUnits: this.getUnits
    });
  }

  onInitData(params) {
    this.filterParams = {};
    _.assign(this.filterParams, this.DEFAULT_FILTER_PARAMS);
    _.assign(this.filterParams, params);
  }

  onFilterData(params) {
    _.assign(this.filterParams, params);

    BrowserHistoryManager.push(this.filterParams);

    return this.fetch();
  }

  onSelect(args) {
    return $.ajax({
      method: 'GET',
      url: `/api/developments/${args[0]}/units/${args[1]}`,
      success: response => {
        this.unit = response.unit;
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
      url: '/api/units',
      data: this.filterParams,
      success: response => {
        this.units = response.units;
        this.facets = response.facets;
        return this.emitChange();
      },
      error(response) {
        console.log('error', response);
      }
    });
  }

  getUnits() {
    return this.getState().units;
  }
}

export default alt.createStore(UnitStore);

