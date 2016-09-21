import alt from '../alt';

import TipActions from '../actions/tip_actions';

class TipStore {

  static displayName = 'TipStore';

  constructor() {
    this.bindActions(TipActions);
    this.joyrideShowed = localStorage.getItem('joyrideShowed');
    this.joyrideStart = false;

    this.overviewLoaded = false;
    this.tipVisible = false;
  }

  joyrideCallback(props){
    if (props.type === 'finished') {
      this.joyrideShowed = true;
      localStorage.setItem('joyrideShowed', true);
    }
  }

  overviewLoaded(prop){
    this.overviewLoaded = prop;
    this.changeJoyrideStart();
  }

  tipVisible(prop){
    this.tipVisible = prop;
    this.changeJoyrideStart();
  }

  changeJoyrideStart() {
    this.joyrideStart = !this.joyrideShowed && this.overviewLoaded && this.tipVisible;
    this.emitChange();
  }
}

export default alt.createStore(TipStore);
