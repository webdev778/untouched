@EnquiryModal = React.createClass

  getInitialState: ->
    {
      submitDisabled: true
    }

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
                 <input type="text" onInput={this.toggleSubmit} ref="name" placeholder="Name" className="form__control"/>
               </fieldset>
               <fieldset className="form__group form__group--inline">
                 <input type="email" onInput={this.toggleSubmit} ref="email" placeholder="Email" className="form__control"/>
               </fieldset>
               <fieldset className="form__group">
                 <textarea ref="body" onInput={this.toggleSubmit} placeholder="Enter your question / comment..." className="form__control"></textarea>
               </fieldset>
               <fieldset className="form__group">
                 <input ref="mortgage" type="checkbox" id="mortgage"/>
                 <label htmlFor="mortgage">Yes, I also want UNTOUCHED to find me the best mortgage.</label>
               </fieldset>
               <fieldset className="form__group">
                 <button type="submit" disabled={this.state.submitDisabled} onClick={this.onSubmit} className="btn btn--primary btn--lg">Send Email to Sales</button>
               </fieldset>
             </form>
           </div>
         </div>
       </div>
       <div className="modal-backdrop fade in" style={this.style()}></div>
     </div>`

   allowSubmission: ->
     _.every [ 'name', 'email', 'body' ], (key) =>
       @refs[key].value.length > 0

   toggleSubmit: (event) ->
     @setState(submitDisabled: !@allowSubmission())

   onSubmit: (event) ->
     event.preventDefault()

     event.target.disabled = true

     EnquiryActions.submitEnquiry(
       name: @refs.name.value
       email: @refs.email.value
       body: @refs.body.value
       mortgage: @refs.mortgage.value
       unit_id: @props.unit.id
     )

     @props.onClose?.call()
     return false
