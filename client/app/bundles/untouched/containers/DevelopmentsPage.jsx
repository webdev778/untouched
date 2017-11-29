import React, { Component } from 'react';
import RouteGenerator from '../route_generator';

import DevelopmentActions from '../actions/development_actions';
import DevelopmentStore from '../stores/development_store';

import Header from '../components/Header';
import Footer from '../components/Footer';
import DismissSidebarTrigger from '../components/DismissSidebarTrigger';
import FilterSidebar from '../components/FilterSidebar';
import DevelopmentList from '../components/development/DevelopmentList';

export default class DevelopmentsPage extends Component {

  state = {
    developments: [],
    filterParams: {}
  }

  componentWillMount() {
    DevelopmentStore.listen(this.onChange);
    $(window).resize(() => this.onResize());
    window.Intercom('boot', { app_id: window.INTERCOM_APP_ID });
    window.lastScrollTop = 0;
    $(window).on("scroll", function(event) {
      var st = $("body").scrollTop();
      var navbarHeight = $(".header-fixed").height();

      // Make sure they scroll more than delta
      if(Math.abs(window.lastScrollTop - st) <= 5)
          return;

      // If they scrolled down and are past the navbar, add class .nav-up.
      // This is necessary so you never see what is "behind" the navbar.
      if (st > window.lastScrollTop && st > navbarHeight){
          // Scroll Down
          $(".header-fixed").hide();
          $(".developments-page .sidebar").addClass("no-padding");
      } else {
          // Scroll Up
          $(".header-fixed").show();
          $(".developments-page .sidebar").removeClass("no-padding");
      }
      window.lastScrollTop = st;
    });

  }

  componentDidMount() {
    DevelopmentActions.filterData(this.parseFiltersFromUrl());
  }

  componentWillUnmount() {
    DevelopmentStore.unlisten(this.onChange);
    window.Intercom('shutdown');
    $(window).off("scroll");
  }

  componentDidUpdate() {
    this.onResize();
  }

  onResize = () => {
    $('.asset-wrap').each(function() {
      let assetW = $(this).width();
      $(this).css('height', assetW / 1.75);
    });
  }

  onChange = (state) => {
    this.setState(state);
  }

  parseFiltersFromUrl() {
    return RouteGenerator.parse(this.props.params.splat);
  }

  render() {
    return (
      <div className="developments-page">

        <div className="sidebar-overlay" onClick={this.handleClickSidebarOverlay} />

        <Header />

        <div className='container'>
          <aside className='sidebar'>
            <div className="sidebar__content">
              <DismissSidebarTrigger />
              <FilterSidebar
                filters={this.parseFiltersFromUrl()}
                facets={this.state.facets}
                actions={DevelopmentActions}
              />
            </div>
            {this.renderShowResults()}
          </aside>

          <main className='main'>
            <DevelopmentList
              filters={this.state.filterParams}
              developments={this.state.developments} 
            />
            <Footer />
          </main>
        </div>

      </div>
    );
  }

  handleClickSidebarOverlay = () => {
    $('body').removeClass('sidebar-on');
  }

  renderShowResults() {
    if (this.state.developments) {
      return (
        <div className="sidebar__show-results" onClick={this.handleClickSidebarOverlay}>Show ({this.state.developments.length}) developments</div>
      );
    }
  }
}

