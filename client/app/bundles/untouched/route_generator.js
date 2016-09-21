import Schema from './schema';

export default class RouteGenerator {
  constructor(params) {
    this.params = params;
  }

  static parseParam(pair) {
    let [ name, value ] = pair;
    let paramType = Schema[name];
    if (paramType === 'array') {
      return [ name, value.split(',') ];
    } else {
      return [ name, value ];
    }
  }


  static parse(str, prefix) {
    if (!str) return {};

    if (prefix) {
      str = str.replace(prefix, '');
    }

    return _.fromPairs(
      _.map(
        _.chunk(str.split('/'), 2), ( pair => {
          return this.parseParam(pair);
        })
      )
    );
  }

  generate() {
    return '/' + _.chain(this.params).map((value, key) => {
      if (value && value.toString().length > 0) {
        return `${key}/${value}`;
      }
    }).compact().value().join('/');
  }
}
