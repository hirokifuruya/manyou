class AddIndexToTasksTaskName < ActiveRecord::Migration[6.0]
  def change
    add_index :tasks, [:task_name, :status]
  end
end
