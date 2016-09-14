Router     = require('react-router').Router
Route      = require('react-router').Route
IndexRoute = require('react-router').IndexRoute
browserHistory = require('react-router').browserHistory

ReactDOM.render((
  <Router history={browserHistory}>

    <Route path="/developments/:developmentId/units/:unitId" component={UnitPage} />
    <Route path="/developments/:developmentId" component={DevelopmentPage}>
      <Route path="*" component={DevelopmentPage} />
    </Route>
    <Route path="/legal" component={LegalPage} />

    <Route path="/" component={DevelopmentsPage}>
      <IndexRoute component={DevelopmentsPage} />
      <Route path="*" component={DevelopmentsPage} />
    </Route>

  </Router>
), document.getElementById('app'));

