import React, { Component } from 'react';
import { Link } from 'react-router';

export default class Footer extends Component {

  render() {
    return (
      <footer>
        <div className="container">
          <div className="copyright-info">
            <span className="copyright-info__copyright">© 2016 Untouched</span>
            <ul className="copyright-info__links">
              <li><Link to="/legal">Terms & Privacy</Link></li>
            </ul>
          </div>
        </div>
      </footer>
    );
  }
}
