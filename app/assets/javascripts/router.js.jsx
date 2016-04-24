var Router = ReactRouter.Router,
Route      = ReactRouter.Route,
IndexRoute = ReactRouter.IndexRoute;

ReactDOM.render((
  <Router history={ReactRouter.hashHistory}>

    <Route path="/developments/:developmentId/units/:unitId" component={UnitPage} />
    <Route path="/developments/:developmentId" component={DevelopmentPage} />

    <Route path="/" component={DevelopmentsPage}>
      <IndexRoute component={DevelopmentsPage} />
      <Route path="*" component={DevelopmentsPage} />
    </Route>
  </Router>
), document.getElementById('app'));

