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
    return this.units = props.units;
  }

  onFilterData(params) {
    _.assign(this.filterParams, params);
    return this.fetch();
  }

  onUpdateUnit(args) {
    let [ id, params ] = args;
    return $.ajax({
      method: 'PUT',
      url: `/api/units/${id}`,
      data: {
        unit: params
      },
      success: response => {
        let idx = _.findIndex(this.units, { id });
        this.units[idx] = response.unit;
        return this.emitChange();
      },
      error: response => {
        return alert("Oops! Something went wrong. Check your data and try again.");
      }
    });
  }

  onCreateUnit(params) {
    return $.ajax({
      method: 'POST',
      url: '/api/units',
      data: {
        unit: params
      },
      success: response => {
        this.units.push(response.unit);
        return this.emitChange();
      },
      error: response => {
        return alert("Oops! Something went wrong. Check your data and try again.");
      }
    });
  }

  onDeleteUnit(id) {
    return $.ajax({
      method: 'DELETE',
      url: `/api/units/${id}`,
      success: response => {
        this.units = _.reject(this.units, u => u.id === parseInt(id));
        return this.emitChange();
      },
      error: response => {
        return alert("Oops! Something went wrong. Please try again.");
      }
    });
  }

  fetch() {
    return $.ajax({
      method: 'GET',
      url: '/api/units',
      data: this.filterParams,
      success: response => {
        this.units = response.units;
        return this.emitChange();
      },
      error(response) {
        console.log('error');
        return console.log(response);
      }
    });
  }

  getUnits() {
    return this.getState().units;
  }
}

window.UnitStore = alt.createStore(UnitStore);

