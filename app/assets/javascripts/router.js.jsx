var Router = ReactRouter.Router,
Route      = ReactRouter.Route,
IndexRoute = ReactRouter.IndexRoute;

ReactDOM.render((
  <Router history={ReactRouter.hashHistory}>
    <Route path="/" component={Application}>
      <IndexRoute component={Application} />
      <Route path="/:city/:region/:suburb" component={Application} />
    </Route>
  </Router>
), document.getElementById('app'));

