@UnitCostsSection = React.createClass

  formattedDepositPercent: ->
    Math.round(@props.unit.deposit_percent * 100)

  formattedDeposit: ->
    accounting.formatMoney(@props.unit.deposit, '$', 0)

  formattedStampDuty: ->
    accounting.formatMoney(@props.unit.stamp_duty, '$', 0)

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
                    <span className="cost__light">Due within 14 days of signing <a href="#!">contract</a></span>
                  </td>
                  <td>{this.formattedDeposit()}</td>
                </tr>
                <tr>
                  <td>
                    <strong>Stamp Duty</strong>
                    <span className="cost__light">Save $23,500</span>
                  </td>
                  <td>{this.formattedStampDuty()}</td>
                </tr>
                <tr>
                  <td>
                    <strong>Annual Body Corporate (Estimated)</strong>
                  </td>
                  <td>$2000</td>
                </tr>
                <tr>
                  <td>
                    <strong>Annual Coucil Rates (Estimated)</strong>
                  </td>
                  <td>$1000</td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
        <button type="button" className="btn btn--light btn--lg btn--full" data-toggle="modal" data-target="#modal-enquire">Enquire Now</button>
      </form>
    </section>`

