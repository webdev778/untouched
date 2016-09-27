import React, { Component } from 'react';
import { Table, editors, cells } from 'reactabular';
import accounting from 'accounting';
import DevelopmentTableEditorFooter from './DevelopmentTableEditorFooter';

import UnitActions from '../actions/unit_actions';
import UnitStore from '../stores/unit_store';

export default class DevelopmentTableEditor extends Component {

  constructor(props) {
    super(props);

    this.state = {
      data: this.getInitialData(),
      columns: this.getColumns()
    }
  }

  componentWillMount() {
    UnitStore.listen(this.onChange);
  }

  componentDidMount() {
    UnitActions.filterData({status: 'any', development_id: this.props.development.id});
    UnitActions.fetch();
  }

  componentWillUnmount() {
    UnitStore.unlisten(this.onChange);
  }

  formatData(data) {
    return _.map(data, u =>
      _.extend(u, {
        status: __guard__(u.status, x => x.toString()) || '',
        kitchen_island: u.kitchen_island ? 't' : ''
      })
    );
  }

  onChange = (state) => {
    return this.setState({data: this.formatData(state.units)});
  }

  

  render() {
    const columns = this.state.columns || [];
    const data    = this.state.data    || [];

    return (
      <Table className="development-table-editor collection-data" columns={columns} data={data} rowKey="id">
        <DevelopmentTableEditorFooter
          development={this.props.development}
          properties={this.properties}
          columns={columns} />
      </Table>
    );
  }

  properties = {
    number: {
      type: 'string'
    },
    unit_type: {
      type: 'string',
      options: [
        {
          name: 'Apartment',
          value: 'apartment'
        },
        {
          name: 'Townhouse',
          value: 'townhouse'
        }
      ]
    },
    aspect: {
      type: 'string',
      options: [
        {
          name: 'North',
          value: 'north'
        },
        {
          name: 'South',
          value: 'south'
        },
        {
          name: 'East',
          value: 'east'
        },
        {
          name: 'West',
          value: 'west'
        }
      ]
    },
    status: {
      type: 'string',
      options: [
        {
          name: 'Active',
          value: 'active'
        },
        {
          name: 'Sold',
          value: 'sold'
        },
        {
          name: 'Held',
          value: 'held'
        }
      ]
    },
    price: {
      type: 'number'
    },
    kitchen_island: {
      type: 'boolean'
    }
  }

  getInitialData() {
    return [ ];
  }

  editable() {
    return cells.edit.bind(this, 'editedCell', (value, cellData, rowIndex, property) => {
      const { id }  = cellData[rowIndex];
      const idx = _.findIndex(this.state.data, { id });

      this.state.data[idx][property] = value;

      let params = {};
      params[property] = value;

      return UnitActions.updateUnit(id, params);
    });
  }

  inputColumn(prop, header, formatter) {
    return {
      property: prop,
      header,
      type: 'input',
      cell: _.compact([ this.editable()({editor: editors.input()}), formatter ])
    };
  }

  dropdownColumn(prop, header, options, formatter) {
    return {
      property: prop,
      header,
      type: 'dropdown',
      cell: [
        this.editable()({editor: editors.dropdown(options)}),
        formatter
      ]
    };
  }

  booleanColumn(prop, header) {
    return {
      property: prop,
      header,
      type: 'boolean',
      cell: [
        this.editable()({editor: editors.boolean()}),
        active => active && <span>&#10003;</span>
      ]
    };
  }

  imagesColumn(prop, countProp, header) {
    return {
      property: countProp,
      header,
      type: 'images',
      cell(value, cellData, rowIndex, property) {
        const { id }  = cellData[rowIndex];
        return (
          <span><a href={`/admin/units/${id}/${prop}`}>{value} {prop}</a></span>
        );
      }
    };
  }

  actionsColumn() {
    const { onDeleteUnit } = this;
    return {
      property: 'id',
      cell(value) {
        return (
          <span><button value={value} onClick={onDeleteUnit}>Delete</button></span>
        );
      }
    };
  }

  formatters = {
    number: (v) => parseInt(v),
    capitalize: (v) => _.upperFirst(v),
    money: (v) => accounting.formatMoney(v, '$', 0)
  }

  getColumns() {
    return [
      this.inputColumn('number', 'Number'),
      this.dropdownColumn('status', 'Status', this.properties.status.options, this.formatters.capitalize),
      this.dropdownColumn('unit_type', 'Type', this.properties.unit_type.options, this.formatters.capitalize),
      this.inputColumn('price', 'Price', this.formatters.money),
      this.imagesColumn('views', 'views_count', 'Views'),
      this.imagesColumn('plans', 'plans_count', 'Plans'),
      this.inputColumn('bedrooms', 'Bd'),
      this.inputColumn('bathrooms', 'Bt'),
      this.inputColumn('parking', 'P'),
      this.inputColumn('internal_in_meters', 'IM2', this.formatters.number),
      this.inputColumn('external_in_meters', 'EM2', this.formatters.number),
      this.dropdownColumn('aspect', 'Aspect', this.properties.aspect.options, this.formatters.capitalize),
      this.inputColumn('max_body_corporate_fee', 'Body', this.formatters.money),
      this.inputColumn('annual_council_rate', 'Council', this.formatters.money),
      this.inputColumn('stamp_duty', 'Stamp', this.formatters.money),
      this.inputColumn('stamp_duty_savings', 'Stamp Sav', this.formatters.money),
      this.booleanColumn('kitchen_island', 'KI'),
      this.booleanColumn('ensuite', 'E'),
      this.booleanColumn('study_nook', 'SN'),
      this.booleanColumn('storage_cage', 'SC'),
      this.booleanColumn('walk_in_wardrobe', 'WIW'),
      this.booleanColumn('bathtub', 'BT'),
      this.booleanColumn('penthouse_level', 'PH'),
      this.booleanColumn('no_stacker', 'NS'),
      this.actionsColumn()
    ];
  }

  onDeleteUnit = (event) => {
    event.persist();
    
    return UnitActions.deleteUnit(event.target.value);
  }
}


function __guard__(value, transform) {
  return (typeof value !== 'undefined' && value !== null) ? transform(value) : undefined;
}