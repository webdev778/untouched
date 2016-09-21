import React, { Component } from 'react';
import { Link } from 'react-router';
import accounting from 'accounting';

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
                      <strong>{this.formattedDepositPercent()}% Deposit</strong>
                      <span className="cost__light">
                        Due within {this.props.unit.deposit_due_in_days} days of signing&nbsp;
                        <Link target="_blank" to={this.props.unit.contract_url}>contract</Link>
                      </span>
                    </td>
                    <td>{this.formattedDeposit()}</td>
                  </tr>
                  <tr>
                    <td>
                      <strong>Stamp Duty</strong>
                      <span className="cost__light">Save {this.formattedStampDutySavings()}</span>
                    </td>
                    <td>{this.formattedStampDuty()}</td>
                  </tr>
                  <tr>
                    <td>
                      <strong>Annual Body Corporate (Estimated)</strong>
                    </td>
                    <td>{this.formattedAnnualBodyCorporate()}</td>
                  </tr>
                  <tr>
                    <td>
                      <strong>Annual Council Rates (Estimated)</strong>
                    </td>
                    <td>{this.formattedAnnualCouncilRate()}</td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
          <button
            onClick={this.onClickEnquire}
            type="button"
            className="btn btn--light btn--lg btn--full"
            data-toggle="modal"
            data-target="#modal-enquire">
            Enquire Now
          </button>
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

