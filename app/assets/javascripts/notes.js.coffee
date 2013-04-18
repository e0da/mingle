$ ->

  $notes = $('#notes')

  $('a[href=#toolbox]').click (event)->
    $notes.hide()

  $('#notes_button').click (event)->
    event.stopPropagation()
    event.preventDefault()
    $notes.fadeIn()
