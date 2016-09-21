import alt from '../alt';

class UnitActions {
  constructor() {
    this.generateActions(
      'initData',
      'select',
      'fetch',
      'filterData'
    );
  }
}

export default alt.createActions(UnitActions);

