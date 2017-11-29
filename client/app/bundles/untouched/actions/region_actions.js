import alt from '../alt';

class RegionActions {
  constructor() {
    this.generateActions(
      'initData',
      'fetch'
    );
  }
}

export default alt.createActions(RegionActions);

