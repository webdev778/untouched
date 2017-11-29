import { browserHistory } from 'react-router';
import RouteGenerator from './route_generator';

export default {
  push(params) {
    let developmentId;

    if (params.dhh) {

      if (developmentId = params.development_id) {
        let routeParams = _.omit(params, 'development_id');
        return this._push(`/dhh/developments/${developmentId}${new RouteGenerator(routeParams).generate()}`);
      } else {
        let routeParams = _.omit(params, 'dhh');
        return this._push(`/dhh${new RouteGenerator(routeParams).generate()}`);
      }

    } else {

      if (developmentId = params.development_id) {
        let routeParams = _.omit(params, 'development_id');
        return this._push(`/developments/${developmentId}${new RouteGenerator(routeParams).generate()}`);
      } else {
        return this._push(new RouteGenerator(params).generate());
      }

    }

    if (developmentId = params.development_id) {
      let routeParams = _.omit(params, 'development_id');
      return this._push(`/developments/${developmentId}${new RouteGenerator(routeParams).generate()}`);
    } else {
      return this._push(new RouteGenerator(params).generate());
    }
  },

  _push(path) {
    if (window.location.pathname !== path) {
      return browserHistory.push(path);
    }
  }
};
