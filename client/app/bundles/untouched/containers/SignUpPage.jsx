import React, { Component } from 'react';
import { Link, Element } from 'react-scroll';

import Header from '../components/Header';
import Footer from '../components/Footer';
import SignUpForm from '../components/Auth/SignUpForm';

export default class SignUpPage extends Component {

  render() {
    return (
      <div className='sign-up sign-up-page'>

        <Header />

        <main className="main">
          <SignUpForm />
        </main>

        <Footer />

      </div>
    );
  }

}
