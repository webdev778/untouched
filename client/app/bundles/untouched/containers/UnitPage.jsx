import React, { Component } from 'react';
import { Link, Element } from 'react-scroll';
import { browserHistory } from 'react-router';

import UnitStore from './../stores/unit_store';
import UnitActions from './../actions/unit_actions';

import Header from '../components/Header';
import Footer from '../components/Footer';
import VisitsCount from '../components/VisitsCount';
import UnitHeaderTable from '../components/unit/UnitHeaderTable';
import UnitPlansSection from '../components/unit/UnitPlansSection';
import UnitViewsSection from '../components/unit/UnitViewsSection';
import UnitCostsSection from '../components/unit/UnitCostsSection';
import DevelopmentActions from '../actions/development_actions';

export default class UnitPage extends Component {

  scrollNav = {
    offset: -63,
    duration: 500
  }

  status = {
    loading: {},
    notFound: {}
  }

  state = {
    unit: this.status.loading
  }

  componentWillMount() {
    // TODO: Can we find a less intrusive way to set the body class?
    $('body').addClass('sidebar-hide development');
    UnitStore.listen(this.onChange);
    window.lastScrollTop = 0;
    $(window).on("scroll", function(event) {
      var st = $("body").scrollTop();
      var navbarHeight = $(".scroll__fixed").height();

      // Make sure they scroll more than delta
      if(Math.abs(window.lastScrollTop - st) <= 5)
          return;

      // If they scrolled down and are past the navbar, add class .nav-up.
      // This is necessary so you never see what is "behind" the navbar.
      if (st > window.lastScrollTop && st > navbarHeight){
          // Scroll Down
          $(".scroll__fixed").hide();
          $(".scroll__wrap").addClass("no-padding");
      } else {
          // Scroll Up
          $(".scroll__fixed").show();
          $(".scroll__wrap").removeClass("no-padding");
      }
      window.lastScrollTop = st;
    });

  }

  componentDidMount() {
    UnitActions.select(this.props.params.developmentId, this.props.params.unitId);
    DevelopmentActions.addFilterData({ backButton: 1 });
  }

  componentDidUpdate(prevProps, prevState) {
    if (this.state.unit !== this.status.loading) {
      document.title = [ this.state.unit.development.address, this.state.unit.number ].join(' ');

      if (prevState.unit === this.status.loading) {
        if (this.state.unit.development.intercom_app_id) {
          window.Intercom('boot', { app_id: this.state.unit.development.intercom_app_id });
        } else {
          window.Intercom('shutdown');
        }
      }
    }
  }

  componentWillUnmount() {
    $('body').removeClass('sidebar-hide development');
    UnitStore.unlisten(this.onChange);
    window.Intercom('shutdown');
    $(window).off("scroll");
  }


  onChange = (state) => {
    this.setState(state);
  }

  render() {
    if (this.state.unit === this.status.loading) {
      return this.renderLoading();
    } else {
      return this.renderSuccess();
    }
  }

  renderLoading() {
    return (
      <div className='unit-page'>
        <Header />
      </div>
    );
  }

  renderSuccess() {
    return (
      <div className='unit-page'>


        <div className="scroll">
          <div className="scroll__fixed">
            <div className="container">
              {this.renderNav()}
            </div>
          </div>
          <div className="scroll__wrap">
            <div className="scroll__content">
              <Element name="plans">
                <UnitPlansSection unit={this.state.unit}/>
              </Element>
              <Element name="views">
                <UnitViewsSection unit={this.state.unit}/>
              </Element>
              <Element name="summary" className="summary__section">
                <VisitsCount count={this.state.unit.visits_count}/>
                <div className="container">
                  <UnitHeaderTable unit={this.state.unit} />
                  <UnitCostsSection unit={this.state.unit}/>
                </div>
              </Element>
            </div>
          </div>
        </div>

        <Footer />

      </div>
    );
  }


  renderNav() {
    return (
      <div className="scroll__nav scroll__nav--static">
        <ul className="clearfix">
          <li role="presentation" className="scroll__li">
            <Link
              activeClass="active"
              isDynamic
              spy={true}
              smooth={true}
              offset={this.scrollNav.offset}
              duration={this.scrollNav.duration}
              to="summary">
              Summary
            </Link>
          </li>
          <li role="presentation" className="scroll__li">
            <Link
              activeClass="active"
              isDynamic
              spy={true}
              smooth={true}
              offset={this.scrollNav.offset}
              duration={this.scrollNav.duration}
              to="views">
              Aspect
            </Link>
          </li>
          <li role="presentation" className="scroll__li">
            <Link
              activeClass="active"
              isDynamic
              spy={true}
              smooth={true}
              offset={this.scrollNav.offset}
              duration={this.scrollNav.duration}
              to="plans">
              Plans
            </Link>
          </li>
        </ul>
        {this.renderDevelopmentLogo()}
      </div>
    );
  }

  renderDevelopmentLogo() {
    if (this.state.unit.development_logo_url) {
      return <a onClick={this.goBackToPricing} ><img src={this.state.unit.development_logo_url} alt={this.state.unit.development.address} className="scroll__logo" /> </a>;
    }
  }
  goBackToPricing = () => {
    browserHistory.push("/developments/" + this.props.params.developmentId);
  }
}

