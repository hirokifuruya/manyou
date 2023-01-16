module TasksHelper
  def sort_order(column, task_name)
    direction = (column == sort_column && sort_direction == 'asc') ? 'desc' : 'asc'
    link_to task_name, { sort: column, direction: direction}
  end
end
