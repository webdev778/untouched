var Router = ReactRouter.Router,
Route      = ReactRouter.Route,
IndexRoute = ReactRouter.IndexRoute;

ReactDOM.render((
  <Router history={ReactRouter.hashHistory}>
    <Route path="/" component={Application}>
      <IndexRoute component={Application} />
      <Route path={new RouteGenerator().interpolatedRouterString()} component={Application} />
    </Route>
  </Router>
), document.getElementById('app'));

