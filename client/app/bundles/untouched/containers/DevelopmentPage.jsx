import React, { Component } from 'react';
import Joyride from 'react-joyride';
import { Link, Element } from 'react-scroll';
import RouteGenerator from '../route_generator';

import DevelopmentActions from '../actions/development_actions';
import DevelopmentStore from '../stores/development_store';
import TipActions from '../actions/tip_actions';
import TipStore from '../stores/tip_store';

import Header from '../components/Header';
import VisitsCount from '../components/VisitsCount';
import DevelopmentOverviewSection from '../components/development/DevelopmentOverviewSection';
import DevelopmentLocationSection from '../components/development/DevelopmentLocationSection';
import DevelopmentPricingSection from '../components/development/DevelopmentPricingSection';

export default class DevelopmentPage extends Component {

  scrollNav = {
    offset: -110,
    duration: 400
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

  hideSidebarIfClickedOutside = (event) => {
    const sidebarEl = $('aside.sidebar').get(0);
    const triggerEl = $('button.sidebar-trigger').get(0);

    if (!$.contains(sidebarEl, event.target) && !$.contains(triggerEl, event.target)) {
      $('body').removeClass('sidebar-on');
    }
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
    DevelopmentStore.listen(this.onChange);
    TipStore.listen(this.onChange);
    $(document).on('click.development_page', event => this.hideSidebarIfClickedOutside(event));
  }

  componentDidMount() {
    DevelopmentActions.select(this.props.params.developmentId);
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
        <Header />
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

        <Header />

        <main className="main">
          <div className="scroll">
            {this.renderNav()}
            {this.renderSections()}
          </div>
        </main>

      </div>
    );
  }

  renderNav() {
    return (
      <div className="scroll__nav scroll__nav--fixed">
        <ul>
          <li role="presentation" className="scroll__li">
            <Link
              activeClass="active"
              spy={true}
              smooth={true}
              offset={this.scrollNav.offset}
              duration={this.scrollNav.duration}
              isDynamic={true}
              to="overview">
            Overview
            </Link>
          </li>
          <li role="presentation" className="scroll__li">
            <Link
              activeClass="active"
              spy={true}
              smooth={true}
              offset={this.scrollNav.offset}
              duration={this.scrollNav.duration}
              isDynamic={true}
              to="location">
            Location
            </Link>
          </li>
          <li role="presentation" className="scroll__li">
            <Link
              activeClass="active"
              spy={true}
              smooth={true}
              offset={this.scrollNav.offset}
              duration={this.scrollNav.duration}
              isDynamic={true}
              to="pricing">
            Pricing
            </Link>
          </li>
        </ul>
        {this.renderLogo()}
      </div>
    );
  }

  renderLogo() {
    if (!this.state.development.logo_url) return '';
    return <img src={this.state.development.logo_url} alt={this.state.development.address} className="scroll__logo" />;
  }

  renderSections() {
    return (
      <div className="scroll__content">
        <Element name="overview">
          <VisitsCount count={this.state.development.visits_count}/>
          <DevelopmentOverviewSection development={this.state.development}/>
        </Element>
        <Element name="location">
          <DevelopmentLocationSection development={this.state.development}/>
        </Element>
        <Element name="pricing">
          <DevelopmentPricingSection
            params={this.props.params}
            filters={this.parseFiltersFromUrl()}
            development={this.state.development}
            tip={!this.state.joyrideShowed && this.state.overviewLoaded}/>
        </Element>
      </div>
    );
  }
}
