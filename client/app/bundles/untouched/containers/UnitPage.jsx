import React, { Component } from 'react';
import { Link, Element } from 'react-scroll';

import UnitStore from './../stores/unit_store';
import UnitActions from './../actions/unit_actions';

import Header from '../components/Header';
import Footer from '../components/Footer';
import VisitsCount from '../components/VisitsCount';
import UnitHeaderTable from '../components/unit/UnitHeaderTable';
import UnitPlansSection from '../components/unit/UnitPlansSection';
import UnitViewsSection from '../components/unit/UnitViewsSection';
import UnitCostsSection from '../components/unit/UnitCostsSection';

export default class UnitPage extends Component {

  scrollNav = {
    offset: -200,
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
  }

  componentDidMount() {
    UnitActions.select(this.props.params.developmentId, this.props.params.unitId);
    window.onpopstate = this.onBackButtonEvent;
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
  }

  onBackButtonEvent = (e) => {
    e.preventDefault()
    alert("back")
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

        <Header />

        <div className="scroll">
          <div className="scroll__fixed">
            <div className="container">
              <UnitHeaderTable unit={this.state.unit} />
              {this.renderNav()}
            </div>
          </div>
          <div className="scroll__wrap">
            <div className="scroll__content">
              <Element name="plans">
                <VisitsCount count={this.state.unit.visits_count}/>
                <UnitPlansSection unit={this.state.unit}/>
              </Element>
              <Element name="views">
                <UnitViewsSection unit={this.state.unit}/>
              </Element>
              <Element name="costs">
                <UnitCostsSection unit={this.state.unit}/>
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
        <ul>
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
              to="costs">
              Costs
            </Link>
          </li>
        </ul>
        {this.renderDevelopmentLogo()}
      </div>
    );
  }

  renderDevelopmentLogo() {
    if (this.state.unit.development_logo_url) {
      return <img src={this.state.unit.development_logo_url} alt={this.state.unit.development.address} className="scroll__logo" />;
    }
  }
}

