# frozen_string_literal: true

# application helper
#
module ApplicationHelper
  def sortable(column, title = nill)
    title ||= column.titleize
    direction = column == sort_column && sort_direction == 'asc' ? 'desc' : 'asc'
    link_to title, { sort: column, direction: direction }
  end
end
