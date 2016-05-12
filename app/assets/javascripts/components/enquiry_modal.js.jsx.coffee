@EnquiryModal = React.createClass

  style: ->
    {
      display: if @props.isOpen then 'block' else 'none'
    }

  render: ->
    `<div className="enquiry-modal">
      <div className="modal fade in" id="modal-enquire" aria-hidden="false" style={this.style()}>
         <div className="modal-dialog">
           <div className="modal-content">
             <button type="button" data-dismiss="modal" aria-label="Close" onClick={this.props.onClose} className="modal__close">×</button>
             <form action="#" className="enquiry">
               <fieldset className="form__group form__group--inline">
                 <input type="text" disabled="disabled" value="Sasha Gilberg" className="form__control"/>
               </fieldset>
               <fieldset className="form__group form__group--inline">
                 <input type="tel" disabled="disabled" value="0431619009" className="form__control"/>
               </fieldset>
               <fieldset className="form__group">
                 <textarea placeholder="Enter your question / comment..." className="form__control"></textarea>
               </fieldset>
               <fieldset className="form__group">
                 <input type="checkbox" id="mortgage"/>
                 <label htmlFor="mortgage">Yes, I also want UNTOUCHED to find me the best mortgage.</label>
               </fieldset>
               <fieldset className="form__group">
                 <button type="submit" className="btn btn--primary btn--lg">Send SMS to Sales</button>
               </fieldset>
               <p>Or call <span className="phone-show" data-phone="0400818">040...</span></p>
             </form>
           </div>
         </div>
       </div>
       <div className="modal-backdrop fade in" style={this.style()}></div>
     </div>`
