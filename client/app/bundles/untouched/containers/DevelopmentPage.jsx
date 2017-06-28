import React, { Component } from 'react';
import Joyride from 'react-joyride';
import { Link, Element } from 'react-scroll';
import RouteGenerator from '../route_generator';
import { browserHistory } from 'react-router';

import DevelopmentActions from '../actions/development_actions';
import DevelopmentStore from '../stores/development_store';
import TipActions from '../actions/tip_actions';
import TipStore from '../stores/tip_store';

import Header from '../components/Header';
import VisitsCount from '../components/VisitsCount';
import DevelopmentOverviewSection from '../components/development/DevelopmentOverviewSection';
import DevelopmentLocationSection from '../components/development/DevelopmentLocationSection';
import DevelopmentPricingSection from '../components/development/DevelopmentPricingSection';
import SidebarDevelopmentTrigger from '../components/SidebarDevelopmentTrigger'
import UnitStore from '../stores/unit_store';
import UnitActions from '../actions/unit_actions';
export default class DevelopmentPage extends Component {
  scrollNav = {
    offset: 0,
    duration: 0
  }

  status = {
    loading: {},
    notFound: {}
  }

  state = {
    development: this.status.loading,
    filterParams: this.parseFiltersFromUrl(),
    steps: [{
      title: 'Floorplans',
      text: 'To see floorplans, <i>click</i> the unit number.',
      selector: '.unit-list-item__tip',
      position: 'top',
      type: 'hover',
      style: {
        mainColor: '#03a9f4'
      }
    }]
  }


  parseFiltersFromUrl() {
    return RouteGenerator.parse(this.props.params.splat);
  }

  onChange = (state) => {
    if(state.development && (state.development.id === parseInt(this.props.params.developmentId)))
    {
      this.setState(state);
    }
  }

  componentWillMount() {
    window.scrollTo(0, 0);
    DevelopmentStore.listen(this.onChange);
    TipStore.listen(this.onChange);
  }

  componentDidMount() {
    DevelopmentActions.select(this.props.params.developmentId);
    window.onpopstate = this.onBackButtonEvent;
  }
  onBackButtonEvent = (e) => {
    e.preventDefault();
    if(this.state.filterParams.dhh) {
      browserHistory.push("/dhh/");
    }
    else {
      browserHistory.push("/pub/");
    }
  }

  componentDidUpdate(prevProps, prevState) {
    if (this.state.development !== this.status.loading) {
      document.title = this.state.development.address;

      if (prevState.development === this.status.loading) {
        if (this.state.development.intercom_app_id) {
          window.Intercom('boot', { app_id: this.state.development.intercom_app_id });
        } else {
          window.Intercom('shutdown');
        }
      }
    }

    if (this.state.joyrideStart && !prevState.joyrideStart) {
      setTimeout(() => {
        this.joyride.start(true);
      }, 100);
    }
  }

  componentWillUnmount() {
    DevelopmentStore.unlisten(this.onChange);
    TipStore.unlisten(this.onChange);
    $(document).off('click.development_page');
    window.Intercom('shutdown');
  }

  render() {
    if (this.state.development === this.status.loading) {
      return this.renderLoading();
    } else {
      return this.renderSuccess();
    }
  }

  renderLoading() {
    return (
      <div className='development development-page'>
      </div>
    );
  }

  renderSuccess() {
    return (
      <div className='development development-page'>

        {!this.state.joyrideShowed &&
        <Joyride
          ref={c => this.joyride = c}
          callback={TipActions.joyrideCallback}
          steps={this.state.steps}
          scrollToFirstStep
          scrollOffset={200}
          locale={{ close: 'Got it' }} />
        }


        <main className="main">
          <Link
              className="availability-btn1"
              activeClass="hide"
              spy={true}
              smooth={true}
              offset={this.scrollNav.offset}
              duration={this.scrollNav.duration}
              isDynamic ={true}
              to="availability">
                AVAILABILITY
          </Link>

          <DevelopmentOverviewSection development={this.state.development}/>
          <DevelopmentLocationSection development={this.state.development}/>
          <Element name="availability">
            <div className="clearfix">
              <div className="logo_section push-left show-in-mobile">
                  {this.renderLogo()}
              </div>
              <SidebarDevelopmentTrigger />
            </div>
            <DevelopmentPricingSection
                params={this.props.params}
                filters={this.parseFiltersFromUrl()}
                development={this.state.development}
                tip={!this.state.joyrideShowed && this.state.overviewLoaded}/>
          </Element>
        </main>

      </div>
    );
  }

  renderLogo() {
    if (!this.state.development.development_logo_url) return '';
    return <img src={this.state.development.development_logo_url} alt={this.state.development.address} />;
  }

}
