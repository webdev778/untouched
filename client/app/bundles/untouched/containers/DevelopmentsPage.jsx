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
  }

  componentDidMount() {
    DevelopmentActions.filterData(this.parseFiltersFromUrl());
  }

  componentWillUnmount() {
    DevelopmentStore.unlisten(this.onChange);
    window.Intercom('shutdown');
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
            <DismissSidebarTrigger />
            <FilterSidebar
              filters={this.parseFiltersFromUrl()}
              facets={this.state.facets}
              actions={DevelopmentActions} 
            />
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
}

