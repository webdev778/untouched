import React, { Component } from 'react';
import { Link } from 'react-router';
import { Motion, spring } from 'react-motion';
import Waypoint from 'react-waypoint';

import DevelopmentActions from '../actions/development_actions';
import DevelopmentStore from '../stores/development_store';

import TryItFreeBox from '../components/TryItFreeBox';
import Header from '../components/Header';
import Footer from '../components/Footer';
import DevelopmentFeed from '../components/development/DevelopmentFeed';

export default class LandingPage extends Component {
  state = {
      developments: [],
  }

  componentWillMount() {
    DevelopmentStore.listen(this.onChange);
  }

  componentDidMount() {
    DevelopmentActions.fetch_latest();
  }

  componentWillUnmount() {
    DevelopmentStore.unlisten(this.onChange);
  }

  onChange = (state) => {
    this.setState(state);
  }

  render() {
    return (
      <div className='landing landing-page'>

        <Header fixed_position={false} sidebarTrigger={false} />

        <main className="main">

          <section className="section section--subheader">
            <div className="container">
              <h1 className="section__title section__title--lg animate">A better way to sell new developments.</h1>

              <form action="" className="form">
                <TryItFreeBox location="landing" />
                <Link to="/how_it_works">
                  See how it works
                </Link>
              </form>
            </div>
          </section>

          <section className="section">
            <div className="container">
              <p className="color-light">
                Latest off the plan apartment and townhouse projects uploaded:
              </p>

              <div className="blocks-wrap">
                {this.renderFeeds()}
              </div>
            </div>
          </section>

        </main>
        <Footer />

      </div>
    );
  }

  renderFeeds() {
    return _.map(this.state.developments, development => (
      <DevelopmentFeed key={development.id} data={development} />
    ));
  }
}

