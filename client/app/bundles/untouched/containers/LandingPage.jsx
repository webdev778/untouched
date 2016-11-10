import React, { Component } from 'react';
import { Link } from 'react-router';
import { Motion, spring } from 'react-motion';
import Waypoint from 'react-waypoint';

import Header from '../components/Header';
import Footer from '../components/Footer';

export default class LandingPage extends Component {

  springConfig = { stiffness: 150, damping: 50 };

  state = {
    hero: {
      x: -65, 
      opacity: 0
    },
    logo: {
      x: 65, 
      opacity: 0
    }
  }

  _handleWaypoint = (type) => ({ previousPosition, currentPosition, event }) => {
    if (currentPosition == 'inside') {
      this.setState({
        [type]: {
          x: spring(0, this.springConfig), 
          opacity: spring(1, this.springConfig)
        }
      });
    } else {
      this.setState({
        [type]: {
          x: spring(65, this.springConfig), 
          opacity: spring(0, this.springConfig)
        }
      });
    }
  }

  render() {
    return (
      <div className='landing landing-page'>

        <Header sidebarTrigger={false} />

        <main className="main">

          <div className="landing__section landing__section-intro text-center">
            <Waypoint onEnter={this._handleWaypoint('hero')} onLeave={this._handleWaypoint('hero')} />
            <Motion defaultStyle={{x: -65, opacity: 0}} style={this.state.hero}>
              {({x, opacity}) =>
                <div className="container">
                  <div style={{
                    transform: `matrix3d(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, ${x}, 0, 1)`,
                    opacity,
                  }}>
                    <div className="landing__elevated">
                      The project portal, re-invented.
                    </div>
                  </div>
                  <figure className="landing__phone" />
                </div>  
              }
            </Motion>
          </div>

          <div className="landing__section text-center">
            <Waypoint onEnter={this._handleWaypoint('logo')} onLeave={this._handleWaypoint('logo')} />
            <Motion defaultStyle={{x: 65, opacity: 0}} style={this.state.logo}>
              {({x, opacity}) =>
                <div className="container">
                  <div style={{
                    transform: `matrix3d(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, ${x}, 0, 1)`,
                    opacity,
                  }}>
                    <div className="landing__cta-tip">Click here and</div>
                    <Link 
                      to="https://medium.com/@sashagilberg/the-project-portal-re-invented-8f3136219bf7#.h924lkx2q" 
                      className="btn btn--cta btn--lg"
                      target="_blank"
                    >
                      SELL PROJECTS FASTER
                    </Link>
                  </div>
                </div>  
              }
            </Motion>
          </div> 

        </main>

        <Footer />

      </div>
    );
  }
}

