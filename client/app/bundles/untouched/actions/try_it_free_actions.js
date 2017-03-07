import alt from '../alt';
import TryItFreeSource from '../sources/try_it_free_source';

class TryItFreeActions {
  submitEmail(params) {
    return TryItFreeSource.create(params);
  }
}

export default alt.createActions(TryItFreeActions);

