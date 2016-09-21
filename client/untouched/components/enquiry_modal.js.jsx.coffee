@EnquiryModal = React.createClass

  getInitialState: ->
    {
      enquiry: null
    }

  componentWillMount: ->
    EnquiryStore.listen(@onChange)

  componentWillUnmount: ->
    EnquiryStore.listen(@onChange)

  onChange: (state) ->
    @setState(state)

  style: ->
    {
      display: if @props.isOpen then 'block' else 'none'
    }

  render: ->
    if @state.enquiry
      `<EnquiryFormSuccessModal unit={this.props.unit} onClose={this.props.onClose} isOpen={this.props.isOpen}/>`
    else if @state.error
      `<EnquiryFormModal error={this.state.error} unit={this.props.unit} onClose={this.props.onClose} isOpen={this.props.isOpen}/>`
    else
      `<EnquiryFormModal unit={this.props.unit} onClose={this.props.onClose} isOpen={this.props.isOpen}/>`

