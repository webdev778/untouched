import alt from '../alt';

import RegionActions from '../actions/region_actions';

class RegionStore {

  static displayName = 'RegionStore';

  constructor() {
    this.bindActions(RegionActions);
    this.regions = [];

    this.exportPublicMethods({
      getRegions: this.getRegions
    });
  }

  onInitData(props) {
    this.regions = props.regions;
  }

  fetch() {
    return $.ajax({
      method: 'GET',
      url: '/api/regions',
      data: this.filterParams,
      success: response => {
        this.regions = response.regions;
        this.emitChange();
      },
      error(response) {
        console.log('error');
        console.log(response);
      }
    });
  }

  getRegions() {
    return this.getState().regions;
  }
}

export default alt.createStore(RegionStore);

