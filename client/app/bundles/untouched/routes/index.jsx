import React from 'react';
import { Route, IndexRoute } from 'react-router';

import UnitPage from './../containers/UnitPage';
import DevelopmentPage from './../containers/DevelopmentPage';
import LegalPage from './../containers/LegalPage';
import DevelopmentsPage from './../containers/DevelopmentsPage';
import DhhPage from './../containers/DhhPage';

export default (
  <Route>
    <Route path="/dhh" component={DhhPage}>
      <IndexRoute component={DevelopmentsPage} />
      
      <Route path="developments/:developmentId/units/:unitId" component={UnitPage} />
      <Route path="developments/:developmentId" component={DevelopmentPage}>
        <Route path="*" component={DevelopmentPage} />
      </Route>
      <Route path="*" component={DevelopmentsPage} />
    </Route>
    
    <Route path="/legal" component={LegalPage} />

    <Route path="/">
      <IndexRoute component={DevelopmentsPage} />
      <Route path="/developments/:developmentId/units/:unitId" component={UnitPage} />
      <Route path="/developments/:developmentId" component={DevelopmentPage}>
        <Route path="*" component={DevelopmentPage} />
      </Route>    
      <Route path="*" component={DevelopmentsPage} />
    </Route>    
  </Route>
);