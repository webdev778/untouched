import 'rc-tabs/assets/index.css';
import React, { Component } from 'react';
import Joyride from 'react-joyride';
import { Link, Element } from 'react-scroll';
import Tabs, { TabPane } from 'rc-tabs';
import TabContent from 'rc-tabs/lib/TabContent';
import InkTabBar from 'rc-tabs/lib/InkTabBar';
import { debounce } from 'throttle-debounce';
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
    current_activeKey: "2"
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
  onClickTab() {
    this.setState({
      current_activeKey: '1',
    });
    window.scrollTo(0, 0);
    $(".availability-btn1").hide();

  }
  componentWillMount() {
    window.scrollTo(0, 0);
    DevelopmentStore.listen(this.onChange);
    TipStore.listen(this.onChange);

    window.lastScrollTop = 0;
    var me = this;
    $(window).on("scroll", function(event) {
      var st = $("body").scrollTop();
      var navbarHeight = $(".scroll__nav").height();

      if ($(".rc-tabs-content .rc-tabs-tabpane:nth-child(3)").hasClass("rc-tabs-tabpane-active")) {

        // If they scrolled down and are past the navbar, add class .nav-up.
        // This is necessary so you never see what is "behind" the navbar.
        if (st > window.lastScrollTop){
            // Scroll Down
            $('.rc-tabs-bar').hide();
            $('.rc-tabs-content').addClass("no-padding");
        } else {
            // Scroll Up
            $('.rc-tabs-bar').show();
            $('.rc-tabs-content').removeClass("no-padding");
        }
      }
      window.lastScrollTop = st;
    });
  }

  componentDidMount() {
    DevelopmentActions.select(this.props.params.developmentId);
    window.onpopstate = this.onBackButtonEvent;
  }
  onBackButtonEvent = (e) => {
    e.preventDefault();
    if(this.state.current_activeKey == "2"){
      if(this.state.filterParams.dhh) {
        browserHistory.push("/dhh/");
      }
      else {
        browserHistory.push("/pub/");
      }
    }
    else {
      var url = '';
      if (this.state.filterParams.dhh) {
        url =  `/dhh/developments/${this.state.development.id}` +
          new RouteGenerator(this.state.filterParams).generate();
      } else {
        url =  `/developments/${this.state.development.id}` +
                          new RouteGenerator(this.state.filterParams).generate();
      }
      browserHistory.push(url);
      $(".availability-btn1").show();
      this.setState({current_activeKey: "2"});
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
          <a className="availability-btn1" onClick={() => this.onClickTab()}>AVAILABILITY</a>
          <Tabs
            defaultActiveKey="2"
            activeKey={this.state.current_activeKey}
            onChange={this.onClickTab}
            renderTabBar={()=><InkTabBar className="scroll__nav tab--fixed hide"/>}
            renderTabContent={()=><TabContent forceRender={true}/>}
            >
                <TabPane tab='Overview' key="2" forceRender={true}>
                  <DevelopmentOverviewSection development={this.state.development}/>
                  <DevelopmentLocationSection development={this.state.development}/>
                  <section className="scroll__section scroll__bottom">
                    <div className="button_section">
                      <a className="availability-btn2" onClick={() => this.onClickTab()}>VIEW AVAILABILITY</a>
                    </div>
                    <div className="logo_section">
                      {this.renderLogo()}
                    </div>
                  </section>

                </TabPane>
                <TabPane tab='Pricing' key="1" forceRender={true}>
                  <div className="clearfix">
                    <div className="logo_section">
                        {this.renderLogo()}
                    </div>
                    <SidebarDevelopmentTrigger />
                  </div>
                  <DevelopmentPricingSection
                      params={this.props.params}
                      filters={this.parseFiltersFromUrl()}
                      development={this.state.development}
                      tip={!this.state.joyrideShowed && this.state.overviewLoaded}/>
                </TabPane>
          </Tabs>
        </main>

      </div>
    );
  }

  renderLogo() {
    if (!this.state.development.development_logo_url) return '';
    return <img src={this.state.development.development_logo_url} alt={this.state.development.address} />;
  }

}
