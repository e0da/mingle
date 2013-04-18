# Accept a jQuery-wrapped table and make it sortable by clicking the column
# headers
class @SortableTable

  constructor: (table)->
    self = this
    @table = table
    @headers().addClass('sortable').click ->
      header = $(this)
      if header.hasClass('sorted')
        header.removeClass('sorted')
        reverse = true
      else
        header.addClass('sorted')
      self.sort_by $(this).index(), reverse

  headers: ->
    @_headers ||= @table.find('th')

  rows: ->
    @_rows ||= @table.find('tbody tr')

  sort_by: (index, reverse)->
    @table.find('tbody').html @rows().sort (left, right)->
      val = ->
        $(this).find("td:nth-child(#{index+1})").text().toLowerCase()

      lval = val.call(left)
      rval = val.call(right)

      if lval < rval
        diff = -1
      else if lval == rval
        diff = 0
      else
        diff = 1

      diff = -diff if reverse
      diff
