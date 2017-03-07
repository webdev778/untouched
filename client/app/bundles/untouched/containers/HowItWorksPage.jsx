import React, { Component } from 'react';
import { Link } from 'react-router';

import Plyr from 'react-plyr';

import TryItFreeBox from '../components/TryItFreeBox';
import Header from '../components/Header';
import Footer from '../components/Footer';

export default class HowItWorksPage extends Component {

  render() {
    return (
      <div className='how-to-works how-to-works-page'>

        <Header fixed_position={false} sidebarTrigger={false} />

        <main className="main">
          <section className="section section--center">
            <div className="container">
              <h1 className="section__title animate">How it works</h1>

              <div className="video-wrap block">
                <Plyr type="vimeo" videoId="143418951" />
              </div>

              <form action="" className="form">
                <TryItFreeBox/>
              </form>
            </div>
          </section>

          <section className="section section--center section--dark section--flatBottom">
            <div className="container">
              <h1 className="section__title animate">A list of all your developments</h1>
              <p>
                The UNTOUCHED home screen shows all the projects you have access to (that a developer shared with you), showing the price an available unit starts from.
              </p>
              <p>
                From here, you can filter projects based on your client's requirements and have a shortlist of suitable options in just a few seconds.
              </p>
              <div className="section__overflow">
                <img src="/images/phone-list.png" alt="List of developments" className="section__img--bottom animate" />
              </div>
            </div>
          </section>

          <section className="section section--center">
            <div className="container">
              <h1 className="section__title animate">Inside a development</h1>
              <p>
                Inside every development, information is organised under three sections. <span className="color-primary">OVERVIEW</span> to see all the marketing collateral; <span className="color-primary">LOCATION</span> Google maps embed; and <span className="color-primary">PRICING</span> to show what’s currently available. From here, you can drill down on individual units.
              </p>

              <div className="blocks-wrap">
                <div className="block animate">
                  <img src="/images/inside01.jpg" alt="Inside" className="block__img" />
                </div>
                <div className="block animate">
                  <img src="/images/inside02.jpg" alt="Inside" className="block__img" />
                </div>
                <div className="block animate">
                  <img src="/images/inside03.jpg" alt="Inside" className="block__img" />
                </div>
              </div>
            </div>
          </section>

          <section className="section section--center section--dark">
            <div className="container">
              <h1 className="section__title animate">Inside a unit</h1>
              <p>
                Information is specific to the individual unit and organised under three core sections. PLANS to show the floorplan and floorplate; ASPECT to show the site location and/or the view from that unit; and all the associated COSTS.
              </p>

              <div className="blocks-wrap">
                <div className="block animate">
                  <img src="/images/inside-unit01.jpg" alt="Inside" className="block__img" />
                </div>
                <div className="block animate">
                  <img src="/images/inside-unit02.jpg" alt="Inside" className="block__img" />
                </div>
                <div className="block animate">
                  <img src="/images/inside-unit03.jpg" alt="Inside" className="block__img" />
                </div>
              </div>
            </div>
          </section>

          <section className="section section--center section--lg">
            <div className="container">
              <h1 className="section__title animate">UNTOUCHED instead of…</h1>
              <dl className="section__faq">
                <dt>
                  <strong>Instead of constantly updating price lists in excel and sending out or uploading updated PDF price lists to your agents and prospects...</strong>
                </dt>
                <dd>
                  ...you’ll mark the status of a unit sold or available on UNTOUCHED and everyone’s price list will be instantly updated. No longer will you keep getting asked if something is still available, what the latest pricing is or have to deal with the pain of two agents reserving the same unit.
                </dd>

                <dt>
                  <strong>Instead of emailing project information as a whole bunch of different PDF attachments, download links or a Dropbox folder…</strong>
                </dt>
                <dd>
                  ...you’ll just email through a single link where the user will be able to view everything online, without needing to download anything. You can also SMS this link so they can view the project instantly on their phone rather than waiting until they’re behind a computer. There’s no need to login or password protect the page because you’ll be sending users a direct URL.
                </dd>

                <dt>
                  <strong>Instead of waiting for leads to digest the information you emailed through ‘when they have some free time’…</strong>
                </dt>
                <dd>
                  ...you’ll be able to get into a sales presentation immediately (even if all you or they have is a phone) - leading to more display suite meetings scheduled, and more on the spot reservation deposits on that first call.
                </dd>

                <dt>
                  <strong>Instead of looking through a long price list looking for the ideal unit...</strong>
                </dt>
                <dd>
                  …you’ll be able to filter down to the exact perfect unit that’s available for sale in just a few clicks. By narrowing the options to just one or two suitable units, you’ll be able to take advantage of the genuine scarcity of the situation and close sales at full price effortlessly.
                </dd>

                <dt>
                  <strong>Instead of scrolling through a floorplan PDF looking for a specific one…</strong>
                </dt>
                <dd>
                  ...you’ll just click on the unit and it’ll show you the exact floorplan for that unit; as well as other information specific to just that unit.
                </dd>

                <dt>
                  <strong>Instead of information being scattered across separate products, lost in inboxes or scrawled across an individual’s notebook...</strong>
                </dt>
                <dd>
                  ...you’ll have everything about a specific development in one place. Organised, centralized and clear so everyone involved in selling your projects knows what to do, where things stand and can get what they need without having to ask around all the time.
                </dd>

                <dt>
                  <strong>Instead of spending ten of thousands getting a custom app built to use as a presentation tool at your display suite…</strong>
                </dt>
                <dd>
                  ...you’ll be able to present on UNTOUCHED by streaming your iPad content to a TV, or simply presenting on the iPad itself.
                </dd>

                <dt>
                  <strong>Instead of wondering what’s going on…</strong>
                </dt>
                <dd>
                  ...UNTOUCHED reports across every project and shares real-time updates on stock movements - and who sold what. Know what’s reserved, cooled-off, signed, unconditional and who’s paid their deposit without nagging anyone.
                </dd>
              </dl>

              <h1 className="section__title animate">Ready to sell better?</h1>
              <p>
                Get more sales at full ask and sell out your project sooner by working smarter on UNTOUCHED.
              </p>

              <form action="" className="form">
                <TryItFreeBox/>
              </form>
            </div>
          </section>

          <section className="section section--center section--grey">
            <div className="container">
              <h1 className="section__title animate">
                UNTOUCHED will have you saying things like:
              </h1>

              <div className="testimonial">
                <p>
                  “Unlike Investorist &amp; Property Platform, UNTOUCHED just works. I don’t have to remember stock information, it’s all there and I can sell confidently knowing the information is up-to-date”
                </p>
                <span className="testimonial__author">Will Winter</span>
                <img src="/images/testimonial01.jpg" alt="Testimonial" className="testimonial__img" />
              </div>

              <div className="testimonial">
                <p>
                  “It shows the status of each unit so I know how my project is going and can more easily manage my agents”
                </p>
                <span className="testimonial__author">Justin Ghedy</span>
                <img src="/images/testimonial01.jpg" alt="Testimonial" className="testimonial__img" />
              </div>

              <div className="testimonial">
                <p>
                  “It helps us maximise our bottom line”
                </p>
                <span className="testimonial__author">Zoltan &amp; John</span>
                <img src="/images/testimonial01.jpg" alt="Testimonial" className="testimonial__img" />
              </div>

              <div className="testimonial">
                <p>
                  “It allows us to bring channel partners onboard easily just by sharing 1 link and run our channel management in-house rather than through a master agent”
                </p>
                <span className="testimonial__author">Rob Salvo</span>
                <img src="/images/testimonial01.jpg" alt="Testimonial" className="testimonial__img" />
              </div>

              <div className="testimonial">
                <p>
                  “It’s helped us sell out a development sooner by making it easier to bring on channel agents, without taking any time”
                </p>
                <span className="testimonial__author">Brian Chua &amp; Ashesh</span>
                <img src="/images/testimonial01.jpg" alt="Testimonial" className="testimonial__img" />
              </div>

              <div className="testimonial">
                <p>
                  “It’s replaced using Google Sheet as our price list management system; and in our thank you emails we no longer have to send a whole bunch of PDF attachments - all the information new enquiries need is there in one link”
                </p>
                <span className="testimonial__author">Michael Ivany</span>
                <img src="/images/testimonial01.jpg" alt="Testimonial" className="testimonial__img" />
              </div>

              <div className="testimonial">
                <p>
                  “It’s like DisplaySweet, but better - and far less expensive”
                </p>
                <span className="testimonial__author">LK Property</span>
                <img src="/images/testimonial01.jpg" alt="Testimonial" className="testimonial__img" />
              </div>

              <div className="testimonial">
                <p>
                  “I’m probably shooting myself in the foot, but I think this is worth much more than $ per project”
                </p>
                <span className="testimonial__author">Georgie Bott</span>
                <img src="/images/testimonial01.jpg" alt="Testimonial" className="testimonial__img" />
              </div>

              <div className="testimonial">
                <p>
                  “Helps me sell when i’m on the road and all I have is my phone”
                </p>
                <span className="testimonial__author">SG</span>
                <img src="/images/testimonial01.jpg" alt="Testimonial" className="testimonial__img" />
              </div>
            </div>
          </section>
        </main>
      </div>

    );
  }

}