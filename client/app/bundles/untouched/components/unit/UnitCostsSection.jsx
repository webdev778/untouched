import React, { Component } from 'react';
import { Link } from 'react-router';
import accounting from 'accounting';
import moment from 'moment';

import EnquiryModal from '../enquiry/EnquiryModal';

export default class UnitCostsSection extends Component {

  state = {
    isModalOpen: false
  }

  formattedDepositPercent() {
    return Math.round(this.props.unit.deposit_percent * 100);
  }

  formattedDeposit() {
    return accounting.formatMoney(this.props.unit.deposit, '$', 0);
  }

  formattedStampDuty() {
    return accounting.formatMoney(this.props.unit.stamp_duty, '$', 0);
  }

  formattedStampDutySavings() {
    return accounting.formatMoney(this.props.unit.stamp_duty_savings, '$', 0);
  }

  formattedAnnualBodyCorporate() {
    return accounting.formatMoney(this.props.unit.max_body_corporate_fee, '$', 0);
  }

  formattedAnnualCouncilRate() {
    return accounting.formatMoney(this.props.unit.annual_council_rate, '$', 0);
  }

  formattedAnnualWaterRate() {
    return accounting.formatMoney(this.props.unit.water_rates, '$', 0);
  }

  formattedReadyAt() {
    return moment(this.props.unit.development.ready_at).format('MMM, YYYY');
  }

  formattedPrice() {
    return accounting.formatMoney(this.props.unit.price, '$', 0);
  }

  render() {
    return (
      <section className="scroll__section">
        <a name="cost"></a>
        <form className="cost-form">
          <div className="form__group">
            <div className="cost-table">
              <table>
                <tbody>
                  <tr>
                    <td>
                      <strong>Price</strong>
                    </td>
                    <td>{this.formattedPrice()}</td>
                  </tr>
                  <tr>
                    <td>
                      <strong>{this.formattedDepositPercent()}% deposit</strong>
                    </td>
                    <td>{this.formattedDeposit()}</td>
                  </tr>
                  <tr>
                    <td>
                      <strong>Car park lot</strong>
                    </td>
                    <td>{this.props.unit.car_park_lot}</td>
                  </tr>
                  <tr>
                    <td>
                      <strong>Storage lot</strong>
                    </td>
                    <td>{this.props.unit.storage_lot}</td>
                  </tr>
                  <tr>
                    <td colSpan="2">
                      <Link target="_blank" to={this.props.unit.contract_url}
                        className="btn btn--light btn--full">
                        Sales contract
                      </Link>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <span className="cost__light">ESTIMATES</span>
                    </td>
                    <td>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <strong>Body corporate</strong>
                    </td>
                    <td>{this.formattedAnnualBodyCorporate()}</td>
                  </tr>
                  <tr>
                    <td>
                      <strong>Council rates</strong>
                    </td>
                    <td>{this.formattedAnnualCouncilRate()}</td>
                  </tr>
                  <tr>
                    <td>
                      <strong>Water rates</strong>
                    </td>
                    <td>{this.formattedAnnualWaterRate()}</td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
          {/*
          <button
            onClick={this.onClickEnquire}
            type="button"
            className="btn btn--light btn--lg btn--full"
            data-toggle="modal"
            data-target="#modal-enquire">
            Enquire Now
          </button>
          */}
        </form>

        <EnquiryModal
          unit={this.props.unit}
          onClose={this.onCloseModal}
          isOpen={this.state.isModalOpen} />
      </section>
    );
  }

  onCloseModal = () => {
    return this.setState({isModalOpen: false});
  }

  onClickEnquire = (event) => {
    return this.setState({isModalOpen: true});
  }
}

