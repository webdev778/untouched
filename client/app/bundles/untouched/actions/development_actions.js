import alt from '../alt';

class DevelopmentActions {
  constructor() {
    this.generateActions(
      'initData',
      'select',
      'fetch',
      'addFilterData',
      'filterData',
      'fetch_latest'
    );
  }
}

export default alt.createActions(DevelopmentActions);

