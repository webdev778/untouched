var Router = ReactRouter.Router;
var Route = ReactRouter.Route;
var IndexRoute = ReactRouter.IndexRoute;

window.routes = (
  <Router history={ReactRouter.hashHistory}>
    <Route path="/" component={Application}>
      <IndexRoute component={Application} />
      <Route path="/:city/:region/:suburb" component={Application} />
    </Route>
  </Router>
);

