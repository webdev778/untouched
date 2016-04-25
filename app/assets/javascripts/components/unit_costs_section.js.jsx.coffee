@UnitCostsSection = React.createClass

  render: ->
    `<section class="scroll__section">
      <a name="cost"></a>
      <form className="cost-form">
        <div className="form__group">
          <div className="cost-table">
            <table>
              <tbody>
                <tr>
                  <td>
                    <strong>10% Deposit</strong>
                    <span className="cost__light">Due within 14 days of signing <a href="#!">contract</a></span>
                  </td>
                  <td>$50,000</td>
                </tr>
                <tr>
                  <td>
                    <strong>Stamp Duty</strong>
                    <span className="cost__light">Save $23,500</span>
                  </td>
                  <td>$2000</td>
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

