#= require twitter/bootstrap/button
#= require sortable_table
#= require filterable_table

$ ->
  people_table = $('.people.index table.index')
  new SortableTable people_table
  new FilterableTable $('#filter-people'), people_table
