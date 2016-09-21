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

window.UnitActions = alt.createActions(UnitActions);

