@DevelopmentTableEditorFooter = React.createClass

  renderEditors: ->
    _.map @props.columns, (column) =>
      switch column.type
        when 'input'
          @renderInputEditor(column)
        when 'dropdown'
          @renderDropdownEditor(column)
        when 'boolean'
          @renderBooleanEditor(column)


  renderInputEditor: (column) ->
    `<td key={column.property}>
      <input type="text" ref={column.property}/>
    </td>`

  renderDropdownEditor: (column) ->
    `<td key={column.property}>
      <select ref={column.property}>
        {this.renderDropdownOptions(column)}
      </select>
    </td>`

  renderDropdownOptions: (column) ->
    prop = @props.properties[column.property]
    _.map prop.options, (option) ->
      `<option key={option.value} value={option.value}>{option.name}</option>`

  renderBooleanEditor: (column) ->
    `<td key={column.property}>
      <input type="checkbox" value="true" ref={column.property}/>
    </td>`

  render: ->
    `<tfoot>
      <tr>
        {this.renderEditors()}
        <td>
          <input onClick={this.handleSubmit} type="submit" value="Add Unit"/>
        </td>
      </tr>
    </tfoot>`

  submitParams: ->
    _.reduce(@props.columns, ((acc, column) =>
      h = {}

      switch column.type
        when 'boolean'
          h[column.property] = @refs[column.property].checked
        else
          h[column.property] = @refs[column.property].value

      _.assign(acc, h)
    ), {})


  handleSubmit: (event) ->
    UnitActions.createUnit(@submitParams())

