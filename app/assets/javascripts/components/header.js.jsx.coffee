@Header = React.createClass
  render: ->
    `<header className="header">
      <div className="container">
        <div className="justifize">
          <div className="justifize__box">
            <SidebarTrigger />
            <a href="/" className="header__logo">
              <img src="/images/logo-untouched.svg" alt="Untouched" />
            </a>
          </div>
        </div>
      </div>
    </header>`


