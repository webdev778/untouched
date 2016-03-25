@Header = React.createClass
  render: ->
    `<header className="header">
      <div className="container">
        <div className="justifize">
          <div className="justifize__box">
            <button type="button" className="btn--flat sidebar-trigger">
              <svg role="img" className="icon icon--filter">
                <use href="images/icons.svg#icon-filter"></use>
              </svg>
            </button>
            <a href="index.html" className="header__logo">
              <img src="images/logo-untouched.svg" alt="Untouched" />
            </a>
          </div>
        </div>
      </div>
    </header>`


