import React from 'react';
import { Router, browserHistory } from 'react-router';
import routes from '../routes/index';
import '../config';

export default (_props, _railsContext) => {
  return (
    <Router history={browserHistory} children={routes} />
  );
};

