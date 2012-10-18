# Accept a jQuerified input and table. When a text is typed in the
# search_input, hide rows in the table's body that do not match the value of
# the search_input.
class @FilterableTable
  constructor: (form, table) ->
    toggle = form.find 'button'
    input  = form.find 'input'
    rows   = table.find('tbody tr')
    case_sensitive = false

    toggle.click (event)->
      event.preventDefault()
      case_sensitive = !case_sensitive
      form.change()

    form.bind 'change keyup mouseup', ->
      rows.hide().filter (index)->
        options = if case_sensitive then '' else 'i'
        $(this).text().match new RegExp "#{input.val()}", options
      .show()
