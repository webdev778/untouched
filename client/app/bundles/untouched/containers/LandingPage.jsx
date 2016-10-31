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

        <Header />

        <main className="main">

          <Waypoint
            onEnter={this._handleWaypoint('hero')}
            onLeave={this._handleWaypoint('hero')}
          />
          <Motion defaultStyle={{x: -65, opacity: 0}} style={this.state.hero}>
            {({x, opacity}) =>
              // children is a callback which should accept the current value of
              // `style`
              <div className="landing__section landing__section-hero text-center">
                <div className="container">
                  <div style={{
                    transform: `matrix3d(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, ${x}, 0, 1)`,
                    opacity,
                  }}>
                    <div className="landing__elevated">
                      The project portal, re-invented.
                    </div>            
                    <Link className="landing__watch">
                      Watch how it works
                    </Link>
                  </div>
                  <figure className="landing__phone" />
                </div>  
              </div> 
            }
          </Motion>

          <Waypoint
            onEnter={this._handleWaypoint('logo')}
            onLeave={this._handleWaypoint('logo')}
          />
          <Motion defaultStyle={{x: -65, opacity: 0}} style={this.state.logo}>
            {({x, opacity}) =>
              <div className="landing__section landing__section-hero text-center" style={{
                transform: `matrix3d(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, ${x}, 0, 1)`,
                opacity,
              }}>
                <div className="container">
                  <div className="landing__hero">
                    HELPS LEADING PROPERTY DEVELOPERS & PROJECT MARKETERS SELL PROJECTS FASTER & MORE EFFORTLESSLY
                  </div>
                  <Link className="landing__logo" to="/">
                    <img src="/images/logo-untouched-white.svg" alt="Untouched" />
                  </Link>
                </div>
              </div>
            }
          </Motion>

          <div className="landing__section landing__section-letter">  
            <div className="container">
              <div className="landing__hero">
                Thoughts From Our Founder & CEO
              </div>
              <div className="landing__letter">
                Hey, I’m Sasha Gilberg, the founder here at UNTOUCHED. 
                <br /><br />
                I’m also selling apartment and townhouses developments all over Melbourne in my role as a Sales Consultant at CastranGilbert, one of Melbourne’s leading project sales & marketing agencies. 
                <br /><br />
                From this vantage point, I’ve realised the most important things sales agents need to spend their time on is scheduling appointments with prospective purchasers, selling to them and bringing in new listing from developers.
                <br /><br />
                But in the process of scheduling appointments and selling, there are some clunky manual processes that not only leave room for expensive errors, but significantly bottleneck their production capacity for number of appointments scheduled and number of sales presentations conducted in a given week. 
                <br /><br />
                Furthermore, these clunky manual processes lengthen the sales cycle, increasing chances of losing the deal.
                <br /><br />
                And as you grow your business and have more projects and more units to sell, that equals more stakeholders, emails, meetings, and interruptions. Stuff slips, communication suffers, everything turns ASAP. This chaos begins to feel like the new normal. But it’s not. Running around with your hair on fire isn’t normal.
                <br /><br />
                Luckily there’s a better way: UNTOUCHED.
                <br /><br />
                I built UNTOUCHED because I was experiencing these same pains. And I wanted them gone! UNTOUCHED is a unique collection of tools and methods for managing your price lists, floorplans, presentation materials and channel partners, all baked into a single organized product. 
                <br /><br />
                No more constantly updating your emails with new attachments as stock moves, no more uncertainty on exactly where a project is at and who sold what, and a much better handle on things. Out with chaos, in with order.
                <br /><br />
                Today, all the new development projects I work on run on UNTOUCHED. It enables me to do in seconds the tasks that used to take hours. 
                <br /><br />
                But that’s not all, it’s also a powerful sales presentation tool that you can use in the office, on the phone or at the display centre to increase your enquiry to deal conversion rate.
                <br /><br />
                As I’m still selling new developments and constantly using the tool, I’m relentlessly refining and improving UNTOUCHED nearly every day. There’s some other stuff out there, but there’s nothing else like UNTOUCHED.
                <br /><br />
                To prove this to you, I’ll be hosting a LIVE webinar on Friday 4th November at 10AM AEST where I’ll show you exactly how I’ve used UNTOUCHED to take my sales to the next level with far less effort - and how agency principals and property developers themselves can enjoy even greater benefits.
                <br /><br />
                I’m 100% certain UNTOUCHED can improve how you manage and sell your new development projects. So please register for the webinar and I look forward to showing you how it all works.
                <br /><br />
                Wishing you all the best,
                Sasha Gilberg, 
                <br /><br />
                Founder at UNTOUCHED / Sales Consultant at CastranGilbert
              </div>
            </div>
          </div>


        </main>

        <Footer />

      </div>
    );
  }
}

