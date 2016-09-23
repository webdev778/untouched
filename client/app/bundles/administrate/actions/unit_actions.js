import alt from '../alt';

class UnitActions {
  constructor() {
    this.generateActions(
      'initData',
      'fetch',
      'updateUnit',
      'createUnit',
      'deleteUnit',
      'filterData'
    );
  }
}

export default alt.createActions(UnitActions);

