import alt from '../alt';

class UserActions {
  constructor() {
    this.generateActions(
      'initData',
      'register',
    );
  }
}

export default alt.createActions(UserActions);
