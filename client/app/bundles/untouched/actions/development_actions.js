import alt from '../alt';

class DevelopmentActions {
  constructor() {
    this.generateActions(
      'initData',
      'select',
      'fetch',
      'filterData'
    );
  }
}

export default alt.createActions(DevelopmentActions);

