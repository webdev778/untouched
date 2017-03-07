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


          <section className="section">
            <div className="container">
              <p className="color-light">
                Latest off the plan apartment and townhouse projects uploaded:
              </p>

              <div className="blocks-wrap">
                <div className="block-container animate">
                  <div className="block">
                    <div className="block__header">
                      <img src="/images/development-company.png" alt="EBG" />
                      <img src="/images/development-name.png" alt="Name" />
                    </div>
                    <img src="/images/development-img.jpg" alt="Development" className="block__img" />
                  </div>
                  <span className="block-subtitle">2 minutes ago</span>
                </div>
                <div className="block-container animate">
                  <div className="block">
                    <div className="block__header">
                      <img src="/images/development-company.png" alt="EBG" />
                      <img src="/images/development-name.png" alt="Name" />
                    </div>
                    <img src="/images/development-img.jpg" alt="Development" className="block__img" />
                  </div>
                  <span className="block-subtitle">2 minutes ago</span>
                </div>
                <div className="block-container animate">
                  <div className="block">
                    <div className="block__header">
                      <img src="/images/development-company.png" alt="EBG" />
                      <img src="/images/development-name.png" alt="Name" />
                    </div>
                    <img src="/images/development-img.jpg" alt="Development" className="block__img" />
                  </div>
                  <span className="block-subtitle">2 minutes ago</span>
                </div>
                <div className="block-container animate">
                  <div className="block">
                    <div className="block__header">
                      <img src="/images/development-company.png" alt="EBG" />
                      <img src="/images/development-name.png" alt="Name" />
                    </div>
                    <img src="/images/development-img.jpg" alt="Development" className="block__img" />
                  </div>
                  <span className="block-subtitle">2 minutes ago</span>
                </div>
                <div className="block-container animate">
                  <div className="block">
                    <div className="block__header">
                      <img src="/images/development-company.png" alt="EBG" />
                      <img src="/images/development-name.png" alt="Name" />
                    </div>
                    <img src="/images/development-img.jpg" alt="Development" className="block__img" />
                  </div>
                  <span className="block-subtitle">2 minutes ago</span>
                </div>
                <div className="block-container animate">
                  <div className="block">
                    <div className="block__header">
                      <img src="/images/development-company.png" alt="EBG" />
                      <img src="/images/development-name.png" alt="Name" />
                    </div>
                    <img src="/images/development-img.jpg" alt="Development" className="block__img" />
                  </div>
                  <span className="block-subtitle">2 minutes ago</span>
                </div>
              </div>
            </div>
          </section>

        </main>


      </div>
    );
  }
}

