import React, { Component } from 'react';
import { Link } from 'react-router';
import { Motion, spring } from 'react-motion';
import Waypoint from 'react-waypoint';

import TryItFreeBox from '../components/TryItFreeBox';
import Header from '../components/Header';
import Footer from '../components/Footer';

export default class LandingPage extends Component {

  render() {
    return (
      <div className='landing landing-page'>

        <Header fixed_position={false} sidebarTrigger={false} />

        <main className="main">

          <section className="section section--subheader">
            <div className="container">
              <h1 className="section__title section__title--lg animate">A better way to sell new developments.</h1>

              <form action="" className="form">
                <TryItFreeBox/>
                <Link to="/how_it_works">
                  See how it works
                </Link>
              </form>
            </div>
          </section>



        </main>


      </div>
    );
  }
}

