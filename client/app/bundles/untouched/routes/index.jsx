import React from 'react';
import { Route, IndexRoute } from 'react-router';

import App from './../containers/App';
import UnitPage from './../containers/UnitPage';
import DevelopmentPage from './../containers/DevelopmentPage';
import LegalPage from './../containers/LegalPage';
import DevelopmentsPage from './../containers/DevelopmentsPage';
import LandingPage from './../containers/LandingPage';
import DhhPage from './../containers/DhhPage';
import SignUpPage from './../containers/SignUpPage';

export default (
  <Route component={App}>
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
      <IndexRoute component={LandingPage} />
      <Route path="/developments/:developmentId/units/:unitId" component={UnitPage} />
      <Route path="/developments/:developmentId" component={DevelopmentPage}>
        <Route path="*" component={DevelopmentPage} />
      </Route>
      <Route path="/landing" component={LandingPage} />
      <Route path="/pub" component={DevelopmentsPage} />
      <Route path="/sign-up" component={SignUpPage} />
      <Route path="*" component={DevelopmentsPage} />
    </Route>
  </Route>
);
