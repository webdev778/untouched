import alt from '../alt';

class UserActions {
  constructor() {
    this.generateActions(
      'initData',
      'session',
      'register',
      'logout',
      'invite',
      'removeInvite',
      'invites',
    );
  }
}

export default alt.createActions(UserActions);
