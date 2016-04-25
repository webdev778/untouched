@UnitCostsSection = React.createClass

  formattedDepositPercent: ->
    Math.round(@props.unit.deposit_percent * 100)

  formattedDeposit: ->
    accounting.formatMoney(@props.unit.deposit, '$', 0)

  formattedStampDuty: ->
    accounting.formatMoney(@props.unit.stamp_duty, '$', 0)

  formattedStampDutySavings: ->
    accounting.formatMoney(@props.unit.stamp_duty_savings, '$', 0)

  formattedAnnualBodyCorporate: ->
    accounting.formatMoney(@props.unit.max_body_corporate_fee, '$', 0)

  formattedAnnualCouncilRate: ->
    accounting.formatMoney(@props.unit.annual_council_rate, '$', 0)

  render: ->
    `<section className="scroll__section">
      <a name="cost"></a>
      <form className="cost-form">
        <div className="form__group">
          <div className="cost-table">
            <table>
              <tbody>
                <tr>
                  <td>
                    <strong>{this.formattedDepositPercent()}% Deposit</strong>
                    <span className="cost__light">Due within {this.props.unit.deposit_due_in_days} days of signing <a href="#!">contract</a></span>
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
                    <strong>Annual Coucil Rates (Estimated)</strong>
                  </td>
                  <td>{this.formattedAnnualCouncilRate()}</td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
        <button type="button" className="btn btn--light btn--lg btn--full" data-toggle="modal" data-target="#modal-enquire">Enquire Now</button>
      </form>
    </section>`

