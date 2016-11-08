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
      x: -65, 
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
            <Waypoint
              onEnter={this._handleWaypoint('hero')}
              onLeave={this._handleWaypoint('hero')}
            />
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

          <div className="landing__section landing__section-letter">  
            <div className="container">
              <div className="landing__hero">
                Sell projects faster, at the highest possible price.
              </div>
              <div className="landing__letter">
                Hey, I’m Sasha Gilberg, the founder here at UNTOUCHED.  
                <br /><br />
                I’m also selling new developments (primarily apartments and townhouses) all over Melbourne in my role as a Sales Consultant at CastranGilbert, one of Melbourne’s leading project sales and marketing agencies.
                <br /><br />
                Having worked across a wide variety of projects both large and small, I realised there were some repetitive processes that wasted a lot of my time, bottlenecking me from spending more time on lead generation, setting appointments and actually selling.
                <br /><br />
                So I created a piece of software to automate some of the repetitive tasks I was doing so that I could be more efficient; and grow my sales volume.
                <br />
                And the next thing you know, I was generating more sales with far less effort. Happy days.
                <br /><br />
                But that was just the beginning. As I worked on more projects and had more units to sell, that equaled more stakeholders, emails, meetings, and interruptions. Stuff slipped, communication suffered, and everything turned ASAP. This chaos began to feel like the new normal. But it’s not normal. Running around with your hair on fire isn’t normal.
                <br /><br />
                So I made a few tweaks and UNTOUCHED was born.
                <br /><br />
                UNTOUCHED is a unique collection of tools and methods for managing your price lists, floorplans, presentation materials and channel partners, all baked into a single organized product.
                <br /><br />
                No more constantly updating your emails with new attachments as stock moves, no more uncertainty on exactly where a project is at and who sold what, and a much better handle on things. Out with chaos, in with order.
                <br /><br />
                All the problems and hassles I previously had to deal with on a daily basis just disappeared and I never had to think about them again. It was wonderful.
                <br /><br />
                Today, all the new development projects I work on run on UNTOUCHED. It enables me to do in seconds the tasks that used to take hours.
                <br /><br />
                I built UNTOUCHED for myself because I wanted to automate the repetitive tasks I was doing to have more time available to generate leads and do deals. But what it's evolved into is something that does so much more:
                <ul>
                  <li>Improves customer experience and makes your project stand out amongst the competition, helping you turn more enquiries into deals.</li>
                  <li>Makes stock management a breeze, keeping your sales agents and channel partners in-sync with a single online price list.</li>
                  <li>Enables you to sell from your phone like never before so that you book in more display suite appointments and secure more on-the-spot reservations.</li>
                  <li>Upgrades your display suite presentation, helping you get more signed contracts on the spot.</li>
                </ul>
                As I’m still selling new developments and using UNTOUCHED every two seconds, I’m relentlessly refining and improving it nearly every day. There’s some other stuff out there, but there’s nothing else like UNTOUCHED.
                <br /><br />
                To prove this to you, I’ll be hosting a LIVE webinar on <a>Friday 11th November at 10AM AEST</a> where I’ll show you exactly how I’ve used UNTOUCHED to take my sales to the next level with far less effort - and how agency principals and property developers can use it to sell projects faster, and at the highest possible price.
                <br /><br />
                I’m 100% certain UNTOUCHED can improve how you manage and sell your new development projects. So please <a>register for the webinar</a> and I look forward to showing you how it all works.
                <br /><br />
                Wishing you all the best,<br />
                Sasha Gilberg, 
                <br /><br />
                Founder at UNTOUCHED / Sales Consultant at CastranGilbert
              </div>
              <hr />
            </div>
          </div>


        </main>

        <Footer />

      </div>
    );
  }
}

