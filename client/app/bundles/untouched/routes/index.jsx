import React from 'react';
import { Route, IndexRoute } from 'react-router';

import UnitPage from './../containers/UnitPage';
import DevelopmentPage from './../containers/DevelopmentPage';
import LegalPage from './../containers/LegalPage';
import DevelopmentsPage from './../containers/DevelopmentsPage';

export default (
  <Route>
    <Route path="/developments/:developmentId/units/:unitId" component={UnitPage} />
    <Route path="/developments/:developmentId" component={DevelopmentPage}>
      <Route path="*" component={DevelopmentPage} />
    </Route>
    <Route path="/legal" component={LegalPage} />

    <Route path="/" component={DevelopmentsPage}>
      <IndexRoute component={DevelopmentsPage} />
      <Route path="*" component={DevelopmentsPage} />
    </Route>
  </Route>
);