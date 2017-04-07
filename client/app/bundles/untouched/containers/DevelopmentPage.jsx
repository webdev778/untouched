import 'rc-tabs/assets/index.css';
import React, { Component } from 'react';
import Joyride from 'react-joyride';
import { Link, Element } from 'react-scroll';
import Tabs, { TabPane } from 'rc-tabs';
import TabContent from 'rc-tabs/lib/TabContent';
import InkTabBar from 'rc-tabs/lib/InkTabBar';
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
import SidebarDevelopmentTrigger from '../components/SidebarDevelopmentTrigger'

export default class DevelopmentPage extends Component {

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
    }],
    current_activeKey: "3"
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
      if(state.filterParams.backButton)
      {
        this.setState({current_activeKey: "1"});
      }
    }
  }
  onClickTab = (key) => {
    this.setState({
      current_activeKey: key,
    });
    window.scrollTo(0, 0);
  }
  componentWillMount() {
    DevelopmentStore.listen(this.onChange);
    TipStore.listen(this.onChange);
    window.lastScrollTop = 0;
    $(window).on("scroll", function(event) {
      var st = $("body").scrollTop();
      var navbarHeight = $(".scroll__nav").height();

      if ($(".rc-tabs-content .rc-tabs-tabpane:nth-child(3)").hasClass("rc-tabs-tabpane-active")) {
        // Make sure they scroll more than delta
        if(Math.abs(window.lastScrollTop - st) <= 5)
            return;

        // If they scrolled down and are past the navbar, add class .nav-up.
        // This is necessary so you never see what is "behind" the navbar.
        if (st > window.lastScrollTop && st > navbarHeight){
            // Scroll Down
            $('.rc-tabs-bar').hide();
            //$('.rc-tabs-content').addClass("no-padding");
        } else {
            // Scroll Up
            $('.rc-tabs-bar').show();
            //$('.rc-tabs-content').removeClass("no-padding");
        }
      }
      window.lastScrollTop = st;
    });
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
    $(window).off("scroll");
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
          <Tabs
            defaultActiveKey="3"
            activeKey={this.state.current_activeKey}
            onChange={this.onClickTab}
            renderTabBar={()=><InkTabBar className="scroll__nav tab--fixed" extraContent={this.renderLogo()}/>}
            renderTabContent={()=><TabContent forceRender={true}/>}
            >
                <TabPane tab='Pricing' key="1">
                  <div className="clearfix">
                    <VisitsCount count={this.state.development.visits_count}/>
                    <SidebarDevelopmentTrigger />
                  </div>
                  <DevelopmentPricingSection
                      params={this.props.params}
                      filters={this.parseFiltersFromUrl()}
                      development={this.state.development}
                      tip={!this.state.joyrideShowed && this.state.overviewLoaded}/>
                </TabPane>
                <TabPane tab='Location' key="2">
                  <DevelopmentLocationSection development={this.state.development}/>
                </TabPane>
                <TabPane tab='Overview' key="3">
                  <DevelopmentOverviewSection development={this.state.development}/>
                </TabPane>
          </Tabs>
        </main>

      </div>
    );
  }

  renderLogo() {
    if (!this.state.development.development_logo_url) return '';
    return <img src={this.state.development.development_logo_url} alt={this.state.development.address} className="scroll__logo" />;
  }

}
