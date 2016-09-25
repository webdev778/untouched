import alt from '../alt';
import axios from 'axios';
import ReactOnRails from 'react-on-rails';
axios.defaults.headers = ReactOnRails.authenticityHeaders();

import UnitActions from '../actions/unit_actions';

class UnitStore {

  static displayName = 'UnitStore';

  DEFAULT_FILTER_PARAMS = {
    status: 'any',
    sort: 'number',
    sort_order: 'asc'
  };

  constructor() {
    this.bindActions(UnitActions);
    this.units        = [];
    this.filterParams = this.DEFAULT_FILTER_PARAMS;

    this.exportPublicMethods({
      getUnits: this.getUnits
    });
  }

  onInitData(props) {
    this.units = props.units;
  }

  onFilterData(params) {
    _.assign(this.filterParams, params);
    return this.fetch();
  }

  onUpdateUnit(args) {
    const [ id, params ] = args;
    return axios({
      method: 'PUT',
      url: `/api/units/${id}`,
      data: {
        unit: params
      },
    }).then((response) => {
      const idx = _.findIndex(this.units, { id });
      this.units[idx] = response.data.unit;
      return this.emitChange();
    }).catch((error) => {
      alert("Oops! Something went wrong. Please try again.");
    });
  }

  onCreateUnit(params) {
    axios({
      method: 'POST',
      url: '/api/units',
      data: {
        unit: params
      }
    }).then((response) => {
      this.units.push(response.data.unit);
      this.emitChange();
    }).catch((error) => {
      alert("Oops! Something went wrong. Please try again.");
    });
  }

  onDeleteUnit(id) {
    axios({
      method: 'DELETE',
      url: `/api/units/${id}`,
    }).then((response) => {
      this.units = _.reject(this.units, u => u.id === parseInt(id));
      this.emitChange();
    }).catch((error) => {
      alert("Oops! Something went wrong. Please try again.");
    });
  }

  fetch() {
    return axios({
      method: 'GET',
      url: '/api/units',
      params: this.filterParams,
    }).then((response) => {
      this.units = response.data.units;
      this.emitChange();
    }).catch((error) => {
      alert("Oops! Something went wrong. Please try again.");
    });
  }

  getUnits() {
    return this.getState().units;
  }
}

export default alt.createStore(UnitStore);

