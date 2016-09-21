import alt from '../alt';

class TipActions {
  constructor() {
    this.generateActions(
      'joyrideCallback',
      'overviewLoaded',
      'tipVisible'
    );
  }
}

export default alt.createActions(TipActions);
